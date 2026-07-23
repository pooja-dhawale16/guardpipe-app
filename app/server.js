const express = require('express');
const app = express();
app.get('/health', (req, res) => res.json({ status: 'ok' }));
app.get('/', (req, res) => res.send('GuardPipe API running'));
app.listen(3000, () => console.log('listening on 3000'));
