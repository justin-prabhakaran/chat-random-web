import { Server, Socket } from "socket.io"
import http from "http"
import express from "express"

import { clearInterval } from "timers";


const server = http.createServer(express());
const io = new Server(server);

var users: Array<Socket> = [];

async function getUsers(from: Socket) {
    if (users.length > 0) {
        return users.pop()
    }
    else return new Promise<Socket>(resolve => {
        const id = setInterval(() => {
            if (users.length > 0) {
                clearInterval(id);
                let u = users.pop()
                if (u?.id !== from.id) {
                    resolve(u!);
                }
            }
        }, 2000);
    });
}

io.on('connection', (socket) => {
    socket.emit('connecsuc', `your id ${socket.id}`);
    users.push(socket);

    socket.on('make', async () => {

        let to = await getUsers(socket);
        socket.emit('connecsuc', `connected with ${to!.id}`);
        to?.emit('connecsuc', `connected with ${socket.id}`)
        users = users.filter(user => user.id !== socket.id);
        socket.on('message', (data) => {
            to!.emit('message', data);
        });

        to?.on('message', (data) => {
            socket.emit('message', data);
        });

        socket.on('disconnect', () => {
            to?.emit('connecsuc', `disconnected with ${socket.id}`);
            users = users.filter(user => user.id !== socket.id);
        });
    });


    socket.onAny((event, args) => {
        users.map(e => {
            console.log(e.id);
        })
        console.log(`${event} | ${args}`);
    })

});

server.listen(3000, () => {
    console.log('SERVER STARTED');
});