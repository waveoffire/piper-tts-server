to run use command:
```
docker run --name piper -p 5000:5000 waveoffire/piper-tts-server:latest
```

now u can use port 5000 as api with simple POST:
```
POST http://localhost:5000
"Text to speech"
(send AS RAW/Text)
```
You can run it on runpod.io.

just make template with this settings:

container image waveoffire/piper-tts-server:latest

expose http port 5000

volume mount path /app

now only Polish language supported, if you need more please contact with me
