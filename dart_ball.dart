import 'dart:html';
import 'dart:math';

CanvasElement canvas;  
CanvasRenderingContext2D ctx;
Ball ball;
Random rand = new Random();
num _lastTimeStamp = 0;
const num ANIMATION_SPEED = 10;

void main() {  
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');
  ball = new Ball();
  querySelector("#canvas").onClick.listen(doMouseDown);
}

class Ball 
{ 
double x =  50; //start x 
double y = 50; //start y 
double r = 15; //ball size (radius) 
double vx = 0; //velocity 
double vy = 0; //velocity
  
  Ball();
} 

//requestAnimationFrame(physics, 1000 / 77);
Future run() async 
{  
  while (true)
  {
  	checkUpdate(await window.animationFrame);
  }
}

void checkUpdate(num delta) 
{  
  final num diff = delta - _lastTimeStamp;
  if (diff > ANIMATION_SPEED) {
    _lastTimeStamp = delta;
    clear();
    drawBall();
    update();
  }
  //run();
}

void doMouseDown(MouseEvent event) 
{
	ball.x = event.client.x; 
  ball.y = event.client.y;
  bool neg = rand.nextBool();
  if (neg)
  {
    ball.vx = rand.nextDouble()*-15;
    ball.vy = rand.nextDouble()*-15;
  }
  else
  {
    ball.vx = rand.nextDouble()*15;
    ball.vy = rand.nextDouble()*15;
  }    
  clear();
  run();
}

void clear()
{
	// Clear display 
  ctx.save(); 
  ctx.fillStyle = "rgba(0, 128, 128, .3)"; 
  ctx.fillRect(0, 0, canvas.width, canvas.height); 
  ctx.restore(); 
}

// Update ball (with Physics! =) 
void update()
{
  // 1 - apply velocity to position (vx -> x) 
  ball.x += ball.vx;
  ball.y += ball.vy; 

  // 2 - apply drag/friction to velocity 
  ball.vx *= .99;
  ball.vy *= .99; 
  // 3 - apply gravity to velocity
  ball.vy += .25;
  ball.vx += .25; 
  // 4 - check for collisions
  if (ball.y + ball.r > canvas.height) 
  { 
    ball.y = canvas.height - ball.r; 
    ball.vy = -ball.vy.abs(); 
  } 
  if (ball.x + ball.r > canvas.width) 
  { 
    ball.x = canvas.width - ball.r; 
    ball.vx = -ball.vx.abs(); 
  }
}
// Draw ball
void drawBall()
{
  ctx.save(); 
  ctx.translate(ball.x, ball.y); 
  ctx.fillStyle = "#ffff00"; 
  ctx.beginPath(); 
  ctx.arc(0, 0, ball.r, 0, pi * 2, true); 
  ctx.closePath(); 
  ctx.fill(); 
  ctx.restore(); 
}