# Mission Mars

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This
plateau, which is curiously rectangular, must be navigated by the rovers so
that their cameras can get a complete view of the surrounding terrain to send
back to Earth.

A rover's position is represented by a combination of `x` and `y` coordinates,
and a letter representing one of the four cardinal compass points. The plateau
is divided up into a grid to simplify navigation. An example position might be
`0 0 N`, which means the rover is in the bottom left corner facing North.

In order to control a rover, NASA sends a simple string of letters. The
possible letters are `L`, `R` and `M`.

`L` and `R` make the rover spin 90 degrees left or right respectively, without
moving from its current position. `M` makes the rover move forward by 1 grid
point, and maintain the same direction.

Assume that the square directly North from `(x, y)` is `(x, y + 1)`.

## Input

The first line of input is the upper-right coordinates of the plateau, the
lower-left coordinates are assumed to be `0, 0`.

The rest of the input is information pertaining to the rovers that have been
deployed. Each rover has two lines of input. The first line gives the rover's
initial position, and the second line is a series of instructions telling the
rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces,
corresponding to the `x` and `y` coordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover
won't start moving until the first one has finished.

### Example

```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

## Output

The output for each rover should be it's final coordinates and heading.

### Example

```
1 3 N
5 1 E
```

## Usage

Ready for _Mission Mars_? You can run this code as follows:

  * Install gems; `bundle install`.
  * Add exec permissions to `mission-mars`; `chmod +x mission-mars`.
  * Execute Mission Mars; `./mission-mars`.
  * Enter input input in the required format, followed by an empty line.

### Docker Compose

This project uses Docker Compose for development. Here's how you can fire up a
development or test environment.

  * Install Docker Compose.
  * Clone this repository and `cd` into the directory.
  * Run `docker compose up -d --build`.
  * Run `docker compose start`.
  * Run `make ssh`.
  * Run `./mission-mars`.
  * Enter input input in the required format, followed by an empty line.
