﻿package com.ilm.game.engine.objects{	import flash.display.Sprite;	public class MovementHandler extends Sprite	{		// most functions here assume a top left corner registration point		public function moveObject(obj:GameObject):void		{			if (obj.dirX != 0) {				obj.velX +=  obj.accel * obj.dirX;			}			if (obj.dirY != 0) {				obj.velY +=  obj.accel * obj.dirY;			}		}		public function update(obj:GameObject):void		{			// limit the object's max speed			if (obj.velX > Math.abs(obj.maxSpeed)) {				obj.velX = obj.maxSpeed;			}			if (obj.velY > Math.abs(obj.maxSpeed)) {				obj.velY +=  obj.maxSpeed;			}			// make the object bounce off the walls of the stage/*			if (obj.x + obj.width / 2 >= 550) {				obj.velX *=  -1;				obj.x = 550 - obj.width / 2;			}			if (obj.x - obj.width / 2 <= 0) {				obj.velX *= -1;				obj.x = 0 + obj.width / 2;			}			if (obj.y + obj.height / 2 >= 400) {				obj.velY *=  -1;				obj.y = 400 - obj.height / 2;			}			if (obj.y - obj.height / 2 <= 0) {				obj.velY *=  -1;				obj.y = 0 + obj.height / 2;			}*/			// delete object if outside bounds			if (obj.x - obj.width / 2 >= 550) {				obj.parent.removeChild(obj);			}			if (obj.x + obj.width / 2 <= 0) {				obj.parent.removeChild(obj);			}			if (obj.y - obj.height / 2 >= 400) {				obj.parent.removeChild(obj);			}			if (obj.y + obj.height / 2 <= 0) {				obj.parent.removeChild(obj);			}			obj.velX *=  obj.friction;			obj.velY *=  obj.friction;			obj.x +=  obj.velX;			obj.y +=  obj.velY;		}		public function ballCollision(ball1:Ball, ball2:Ball):void		{			var distX:Number = ball1.x - ball2.x;			var distY:Number = ball1.y - ball2.y;			var collisionAngle:Number = Math.atan2(distY,distX);			var magBall1:Number = Math.sqrt(ball1.velX * ball1.velX + ball1.velY * ball1.velY);			var magBall2:Number = Math.sqrt(ball2.velX * ball2.velX + ball2.velY * ball2.velY);			var angleBall1:Number = Math.atan2(ball1.velY,ball1.velX);			var angleBall2:Number = Math.atan2(ball2.velY,ball2.velX);			var speedX1:Number = magBall1 * Math.cos(angleBall1 - collisionAngle);			var speedY1:Number = magBall1 * Math.sin(angleBall1 - collisionAngle);			var speedX2:Number = magBall2 * Math.cos(angleBall2 - collisionAngle);			var speedY2:Number = magBall2 * Math.sin(angleBall2 - collisionAngle);			var finalxSpeedBall1:Number = ((ball1.mass - ball2.mass) * speedX1 + (ball2.mass + ball2.mass) * speedX2) / (ball1.mass + ball2.mass);			var finalxSpeedBall2:Number = ((ball1.mass + ball1.mass) * speedX1 + (ball2.mass - ball1.mass) * speedX2) / (ball1.mass + ball2.mass);			var finalySpeedBall1:Number = speedY1;			var finalySpeedBall2:Number = speedY2;			var dispX:Number = Math.cos(Math.atan2(distY,distX)) * (ball1.width / 2 + ball2.width / 2);			var dispY:Number = Math.sin(Math.atan2(distY,distX)) * (ball1.width / 2 + ball2.width / 2);			ball1.x = ball2.x + dispX;			ball1.y = ball2.y + dispY;			ball1.velX = Math.cos(collisionAngle) * finalxSpeedBall1 + Math.cos(collisionAngle + Math.PI / 2) * finalySpeedBall1;			ball1.velY = Math.sin(collisionAngle) * finalxSpeedBall1 + Math.sin(collisionAngle + Math.PI / 2) * finalySpeedBall1;			ball2.velX = Math.cos(collisionAngle) * finalxSpeedBall2 + Math.cos(collisionAngle + Math.PI / 2) * finalySpeedBall2;			ball2.velY = Math.sin(collisionAngle) * finalxSpeedBall2 + Math.sin(collisionAngle + Math.PI / 2) * finalySpeedBall2;		}	}}