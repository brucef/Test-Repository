﻿package com.ilm.utils.interactions{	import flash.display.Sprite;	import flash.display.Stage;	import flash.events.MouseEvent;		public class MouseObject extends Sprite	{		private var mouseIsDown:Boolean = false;		public function MouseObject(stage:Stage)		{			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);		}		public function isDown():Boolean		{			return mouseIsDown;		}		private function mouseDownHandler(event:MouseEvent):void		{			mouseIsDown = true;		}		private function mouseUpHandler(event:MouseEvent):void		{			mouseIsDown = false;		}	}}