package stardustProtos {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import stardustProtos.ParticleSnapshot;
	use namespace used_by_generated_code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public final class ParticleSnapshots extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PARTICLES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("stardustProtos.ParticleSnapshots.particles", "particles", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return stardustProtos.ParticleSnapshot; });

		[ArrayElementType("stardustProtos.ParticleSnapshot")]
		public var particles:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var particles$index:uint = 0; particles$index < this.particles.length; ++particles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.particles[particles$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.particles.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new stardustProtos.ParticleSnapshot()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
