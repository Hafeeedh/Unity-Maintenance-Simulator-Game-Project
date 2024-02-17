
const clientSocket=({message})=>{
const socket = new WebSocket('ws://localhost:3004');
socket.addEventListener('open', () => {
  console.log('Connected to WebSocket server');
  socket.send(JSON.stringify({message:message}));
});

socket.addEventListener('message', (event) => {
  console.log('Received message:', event.data);
});

socket.addEventListener('close', () => {
  console.log('Connection closed');
});

socket.addEventListener('error', (error) => {
  console.error('WebSocket error:', error.message);
});
return socket;
}
export { clientSocket };
