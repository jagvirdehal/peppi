# Peppi

I'm trying to make an open source game in Godot. The purpose for open source is for ease of use, longevity of the project, and to track my slow but steady progress developing the game.

## Gameplay

The gameplay will be a fast paced 2.5d platform fighter. My focus is to make a game that is fun to watch and easy to follow. I want the viewer to have a "I can do that" feeling before getting absolutely destroyed.

## Development focus

One word: Compatability

- I want this game to be very optimized
  - It should be able to run on low-end hardware, so decent performance on power saving mode on my 13" Dell XPS would be excellent
  - Ideally, this game should be able to run on multiple architectures as well, such as implementations of RISC-V
- I want this game to run on any monitor
  - It should look good at ridiculous aspect ratios
  - Minimum 60Hz, otherwise the speed is comprimised
  - It should be playable on a phone-sized screen (if not a phone)
- I want this game to work on ridiculous network setups (if I add online multiplayer)
  - It should be playable across the country
  - It should use P2P or open source servers for maximum compatibility
  - Rollback netcode?
  - How to counter cheating?
- I want this game to be accessible to everyone
  - It should be competitive and skillful, but also inviting
  - Similar in essence to a racing game that is full of skill, but also feels like anyone can win

## Payment model

My current thoughts are that the game can be free to download and compile if anyone wants (hence the open source) but will also have a Steam version which I will charge money for. The consumer advantage of using the steam version would be automatic updates & convenience of having it bound to their account.

## Art & Assets

This is a much less thought out part of the game that I imagine could come later in development. My current idea is to use animals I have a connection to as the various fighters in the game. Eg. bunny, monkey, panda.

### 3D Art (preferred)
For the models, I will have to learn how to create 3D models in Blender. While learning to use Blender, I believe I could also create a rig for the bodies and program different animations in. I'm not 100% sure about this, but it could be a decent approach to start.

### 2D Art
I want to avoid doing a 2D game, even though it may be a little easier for me to create the art for, and may be easier to run on certain systems. However, I am insistent on doing this game in a 2.5D style for the flexibility that extra dimension can provide when animating, and designing the gameplay.

However, learning and creating models in 3D may be a huge time investment. So, another approach to the art would be creating pixel art in Aseprite, since that is something I have a little bit of practice in.

## Goals/Accomplishments

- [x] Render two cubes
- [x] Environment
  - [x] Add a stage
  - [x] Add lighting
  - [x] Add a camera
- [ ] Physics
  - [ ] Implement gravity
  - [ ] Collision
- [ ] Control
  - [ ] Control a cube with WASD
  - [ ] Control a cube with Arrow Keys
  - [ ] Add jumping
  - [ ] Add controller support
