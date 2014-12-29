package com.funkypandagame.stardustplayer
{
import idv.cjcat.stardustextended.twoD.particles.Particle2D;

public class Particle2DSnapshot {

    public var x:Number;
    public var y:Number;
    public var vx:Number;
    public var vy:Number;
    public var rotation:Number;
    public var omega:Number;
    public var initLife:Number;
    public var initScale:Number;
    public var initAlpha:Number;
    public var life:Number;
    public var scale:Number;
    public var alpha:Number;
    public var mass:Number;
    public var mask:int;
    public var isDead:Boolean;
//    public var collisionRadius:Number;
    public var colorR:Number;
    public var colorG:Number;
    public var colorB:Number;
    public var currentAnimationFrame : int;

    public function storeParticle(p2d : Particle2D) : void
    {
        x = p2d.x;
        y = p2d.y;
        vx = p2d.vx;
        vy = p2d.vy;
        rotation = p2d.rotation;
        omega = p2d.omega;
        initLife = p2d.initLife;
        initScale = p2d.initScale;
        initAlpha = p2d.initAlpha;
        life = p2d.life;
        scale = p2d.scale;
        alpha = p2d.alpha;
        mass = p2d.mass;
        mask = p2d.mask;
        isDead = p2d.isDead;
//        collisionRadius = p2d.collisionRadius;
        colorR = p2d.colorR;
        colorG = p2d.colorG;
        colorB = p2d.colorB;
        currentAnimationFrame = p2d.currentAnimationFrame;
    }

    public function writeDataTo(p2d : Particle2D) : void
    {
        p2d.x = x;
        p2d.y = y;
        p2d.vx = vx;
        p2d.vy = vy;
        p2d.rotation = rotation;
        p2d.omega = omega;
        p2d.initLife = initLife;
        p2d.initScale = initScale;
        p2d.initAlpha = initAlpha;
        p2d.life = life;
        p2d.scale = scale;
        p2d.alpha = alpha;
        p2d.mass = mass;
        p2d.mask = mask;
        p2d.isDead = isDead;
//        p2d.collisionRadius = collisionRadius;
        p2d.colorR = colorR;
        p2d.colorG = colorG;
        p2d.colorB = colorB;
        p2d.currentAnimationFrame = currentAnimationFrame;
    }
}
}
