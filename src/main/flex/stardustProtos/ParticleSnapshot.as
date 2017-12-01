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

		public var x:Number;

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.y", "y", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var y:Number;

		/**
		 *  @private
		 */
		public static const VX:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.vx", "vx", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var vx:Number;

		/**
		 *  @private
		 */
		public static const VY:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.vy", "vy", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var vy:Number;

		/**
		 *  @private
		 */
		public static const ROTATION:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.rotation", "rotation", (5 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var rotation:Number;

		/**
		 *  @private
		 */
		public static const OMEGA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.omega", "omega", (6 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var omega:Number;

		/**
		 *  @private
		 */
		public static const INITLIFE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.initLife", "initLife", (7 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var initLife:Number;

		/**
		 *  @private
		 */
		public static const INITSCALE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.initScale", "initScale", (8 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var initScale:Number;

		/**
		 *  @private
		 */
		public static const INITALPHA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.initAlpha", "initAlpha", (9 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var initAlpha:Number;

		/**
		 *  @private
		 */
		public static const LIFE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.life", "life", (10 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var life:Number;

		/**
		 *  @private
		 */
		public static const SCALE:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.scale", "scale", (11 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var scale:Number;

		/**
		 *  @private
		 */
		public static const ALPHA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.alpha", "alpha", (12 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var alpha:Number;

		/**
		 *  @private
		 */
		public static const MASS:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.mass", "mass", (13 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var mass:Number;

		/**
		 *  @private
		 */
		public static const ISDEAD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("stardustProtos.ParticleSnapshot.isDead", "isDead", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		public var isDead:Boolean;

		/**
		 *  @private
		 */
		public static const COLORR:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.colorR", "colorR", (15 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var colorR:Number;

		/**
		 *  @private
		 */
		public static const COLORG:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.colorG", "colorG", (16 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var colorG:Number;

		/**
		 *  @private
		 */
		public static const COLORB:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("stardustProtos.ParticleSnapshot.colorB", "colorB", (17 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var colorB:Number;

		/**
		 *  @private
		 */
		public static const CURRENTANIMATIONFRAME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("stardustProtos.ParticleSnapshot.currentAnimationFrame", "currentAnimationFrame", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		public var currentAnimationFrame:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.x);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.y);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.vx);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.vy);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 5);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.rotation);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 6);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.omega);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 7);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.initLife);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 8);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.initScale);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 9);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.initAlpha);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 10);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.life);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 11);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.scale);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 12);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.alpha);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 13);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.mass);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
			com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, this.isDead);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 15);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.colorR);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 16);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.colorG);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 17);
			com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.colorB);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.currentAnimationFrame);
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
