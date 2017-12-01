package stardustProtos {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	use namespace used_by_generated_code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public final class ParticleSnapshot extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const X:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.x", "x", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var x$field:Number;

		private var hasField$0:uint = 0;

		public function clearX():void {
			hasField$0 &= 0xfffffffe;
			x$field = new Number();
		}

		public function get hasX():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set x(value:Number):void {
			hasField$0 |= 0x1;
			x$field = value;
		}

		public function get x():Number {
			return x$field;
		}

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.y", "y", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var y$field:Number;

		public function clearY():void {
			hasField$0 &= 0xfffffffd;
			y$field = new Number();
		}

		public function get hasY():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set y(value:Number):void {
			hasField$0 |= 0x2;
			y$field = value;
		}

		public function get y():Number {
			return y$field;
		}

		/**
		 *  @private
		 */
		public static const VX:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.vx", "vx", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var vx$field:Number;

		public function clearVx():void {
			hasField$0 &= 0xfffffffb;
			vx$field = new Number();
		}

		public function get hasVx():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set vx(value:Number):void {
			hasField$0 |= 0x4;
			vx$field = value;
		}

		public function get vx():Number {
			return vx$field;
		}

		/**
		 *  @private
		 */
		public static const VY:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.vy", "vy", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var vy$field:Number;

		public function clearVy():void {
			hasField$0 &= 0xfffffff7;
			vy$field = new Number();
		}

		public function get hasVy():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set vy(value:Number):void {
			hasField$0 |= 0x8;
			vy$field = value;
		}

		public function get vy():Number {
			return vy$field;
		}

		/**
		 *  @private
		 */
		public static const ROTATION:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.rotation", "rotation", (5 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var rotation$field:Number;

		public function clearRotation():void {
			hasField$0 &= 0xffffffef;
			rotation$field = new Number();
		}

		public function get hasRotation():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set rotation(value:Number):void {
			hasField$0 |= 0x10;
			rotation$field = value;
		}

		public function get rotation():Number {
			return rotation$field;
		}

		/**
		 *  @private
		 */
		public static const OMEGA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.omega", "omega", (6 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var omega$field:Number;

		public function clearOmega():void {
			hasField$0 &= 0xffffffdf;
			omega$field = new Number();
		}

		public function get hasOmega():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set omega(value:Number):void {
			hasField$0 |= 0x20;
			omega$field = value;
		}

		public function get omega():Number {
			return omega$field;
		}

		/**
		 *  @private
		 */
		public static const INITLIFE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.initLife", "initLife", (7 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var initLife$field:Number;

		public function clearInitLife():void {
			hasField$0 &= 0xffffffbf;
			initLife$field = new Number();
		}

		public function get hasInitLife():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set initLife(value:Number):void {
			hasField$0 |= 0x40;
			initLife$field = value;
		}

		public function get initLife():Number {
			return initLife$field;
		}

		/**
		 *  @private
		 */
		public static const INITSCALE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.initScale", "initScale", (8 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var initScale$field:Number;

		public function clearInitScale():void {
			hasField$0 &= 0xffffff7f;
			initScale$field = new Number();
		}

		public function get hasInitScale():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set initScale(value:Number):void {
			hasField$0 |= 0x80;
			initScale$field = value;
		}

		public function get initScale():Number {
			return initScale$field;
		}

		/**
		 *  @private
		 */
		public static const INITALPHA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.initAlpha", "initAlpha", (9 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var initAlpha$field:Number;

		public function clearInitAlpha():void {
			hasField$0 &= 0xfffffeff;
			initAlpha$field = new Number();
		}

		public function get hasInitAlpha():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set initAlpha(value:Number):void {
			hasField$0 |= 0x100;
			initAlpha$field = value;
		}

		public function get initAlpha():Number {
			return initAlpha$field;
		}

		/**
		 *  @private
		 */
		public static const LIFE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.life", "life", (10 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var life$field:Number;

		public function clearLife():void {
			hasField$0 &= 0xfffffdff;
			life$field = new Number();
		}

		public function get hasLife():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set life(value:Number):void {
			hasField$0 |= 0x200;
			life$field = value;
		}

		public function get life():Number {
			return life$field;
		}

		/**
		 *  @private
		 */
		public static const SCALE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.scale", "scale", (11 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var scale$field:Number;

		public function clearScale():void {
			hasField$0 &= 0xfffffbff;
			scale$field = new Number();
		}

		public function get hasScale():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set scale(value:Number):void {
			hasField$0 |= 0x400;
			scale$field = value;
		}

		public function get scale():Number {
			return scale$field;
		}

		/**
		 *  @private
		 */
		public static const ALPHA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.alpha", "alpha", (12 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var alpha$field:Number;

		public function clearAlpha():void {
			hasField$0 &= 0xfffff7ff;
			alpha$field = new Number();
		}

		public function get hasAlpha():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set alpha(value:Number):void {
			hasField$0 |= 0x800;
			alpha$field = value;
		}

		public function get alpha():Number {
			return alpha$field;
		}

		/**
		 *  @private
		 */
		public static const MASS:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.mass", "mass", (13 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var mass$field:Number;

		public function clearMass():void {
			hasField$0 &= 0xffffefff;
			mass$field = new Number();
		}

		public function get hasMass():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set mass(value:Number):void {
			hasField$0 |= 0x1000;
			mass$field = value;
		}

		public function get mass():Number {
			return mass$field;
		}

		/**
		 *  @private
		 */
		public static const ISDEAD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("stardustProtos.ParticleSnapshot.isDead", "isDead", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var isDead$field:Boolean;

		public function clearIsDead():void {
			hasField$0 &= 0xffffdfff;
			isDead$field = new Boolean();
		}

		public function get hasIsDead():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set isDead(value:Boolean):void {
			hasField$0 |= 0x2000;
			isDead$field = value;
		}

		public function get isDead():Boolean {
			return isDead$field;
		}

		/**
		 *  @private
		 */
		public static const COLORR:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.colorR", "colorR", (15 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var colorR$field:Number;

		public function clearColorR():void {
			hasField$0 &= 0xffffbfff;
			colorR$field = new Number();
		}

		public function get hasColorR():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set colorR(value:Number):void {
			hasField$0 |= 0x4000;
			colorR$field = value;
		}

		public function get colorR():Number {
			return colorR$field;
		}

		/**
		 *  @private
		 */
		public static const COLORG:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.colorG", "colorG", (16 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var colorG$field:Number;

		public function clearColorG():void {
			hasField$0 &= 0xffff7fff;
			colorG$field = new Number();
		}

		public function get hasColorG():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set colorG(value:Number):void {
			hasField$0 |= 0x8000;
			colorG$field = value;
		}

		public function get colorG():Number {
			return colorG$field;
		}

		/**
		 *  @private
		 */
		public static const COLORB:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.colorB", "colorB", (17 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var colorB$field:Number;

		public function clearColorB():void {
			hasField$0 &= 0xfffeffff;
			colorB$field = new Number();
		}

		public function get hasColorB():Boolean {
			return (hasField$0 & 0x10000) != 0;
		}

		public function set colorB(value:Number):void {
			hasField$0 |= 0x10000;
			colorB$field = value;
		}

		public function get colorB():Number {
			return colorB$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENTANIMATIONFRAME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("stardustProtos.ParticleSnapshot.currentAnimationFrame", "currentAnimationFrame", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var currentAnimationFrame$field:int;

		public function clearCurrentAnimationFrame():void {
			hasField$0 &= 0xfffdffff;
			currentAnimationFrame$field = new int();
		}

		public function get hasCurrentAnimationFrame():Boolean {
			return (hasField$0 & 0x20000) != 0;
		}

		public function set currentAnimationFrame(value:int):void {
			hasField$0 |= 0x20000;
			currentAnimationFrame$field = value;
		}

		public function get currentAnimationFrame():int {
			return currentAnimationFrame$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, x$field);
			}
			if (hasY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, y$field);
			}
			if (hasVx) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, vx$field);
			}
			if (hasVy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, vy$field);
			}
			if (hasRotation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, rotation$field);
			}
			if (hasOmega) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, omega$field);
			}
			if (hasInitLife) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, initLife$field);
			}
			if (hasInitScale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, initScale$field);
			}
			if (hasInitAlpha) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, initAlpha$field);
			}
			if (hasLife) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, life$field);
			}
			if (hasScale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, scale$field);
			}
			if (hasAlpha) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, alpha$field);
			}
			if (hasMass) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, mass$field);
			}
			if (hasIsDead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, isDead$field);
			}
			if (hasColorR) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, colorR$field);
			}
			if (hasColorG) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, colorG$field);
			}
			if (hasColorB) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, colorB$field);
			}
			if (hasCurrentAnimationFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, currentAnimationFrame$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var x$count:uint = 0;
			var y$count:uint = 0;
			var vx$count:uint = 0;
			var vy$count:uint = 0;
			var rotation$count:uint = 0;
			var omega$count:uint = 0;
			var initLife$count:uint = 0;
			var initScale$count:uint = 0;
			var initAlpha$count:uint = 0;
			var life$count:uint = 0;
			var scale$count:uint = 0;
			var alpha$count:uint = 0;
			var mass$count:uint = 0;
			var isDead$count:uint = 0;
			var colorR$count:uint = 0;
			var colorG$count:uint = 0;
			var colorB$count:uint = 0;
			var currentAnimationFrame$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (x$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.x cannot be set twice.');
					}
					++x$count;
					this.x = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (y$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.y cannot be set twice.');
					}
					++y$count;
					this.y = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 3:
					if (vx$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.vx cannot be set twice.');
					}
					++vx$count;
					this.vx = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 4:
					if (vy$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.vy cannot be set twice.');
					}
					++vy$count;
					this.vy = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 5:
					if (rotation$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.rotation cannot be set twice.');
					}
					++rotation$count;
					this.rotation = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 6:
					if (omega$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.omega cannot be set twice.');
					}
					++omega$count;
					this.omega = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 7:
					if (initLife$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.initLife cannot be set twice.');
					}
					++initLife$count;
					this.initLife = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 8:
					if (initScale$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.initScale cannot be set twice.');
					}
					++initScale$count;
					this.initScale = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 9:
					if (initAlpha$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.initAlpha cannot be set twice.');
					}
					++initAlpha$count;
					this.initAlpha = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 10:
					if (life$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.life cannot be set twice.');
					}
					++life$count;
					this.life = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 11:
					if (scale$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.scale cannot be set twice.');
					}
					++scale$count;
					this.scale = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 12:
					if (alpha$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.alpha cannot be set twice.');
					}
					++alpha$count;
					this.alpha = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 13:
					if (mass$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.mass cannot be set twice.');
					}
					++mass$count;
					this.mass = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 14:
					if (isDead$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.isDead cannot be set twice.');
					}
					++isDead$count;
					this.isDead = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 15:
					if (colorR$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.colorR cannot be set twice.');
					}
					++colorR$count;
					this.colorR = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 16:
					if (colorG$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.colorG cannot be set twice.');
					}
					++colorG$count;
					this.colorG = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 17:
					if (colorB$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.colorB cannot be set twice.');
					}
					++colorB$count;
					this.colorB = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 18:
					if (currentAnimationFrame$count != 0) {
						throw new flash.errors.IOError('Bad data format: ParticleSnapshot.currentAnimationFrame cannot be set twice.');
					}
					++currentAnimationFrame$count;
					this.currentAnimationFrame = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
