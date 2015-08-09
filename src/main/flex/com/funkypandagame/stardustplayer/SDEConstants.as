package com.funkypandagame.stardustplayer {

public class SDEConstants
{

    private static const EMITTER_NAME_PREFIX : String = "stardustEmitter_";
    public static const ATLAS_IMAGE_NAME = "atlas_0.png";
    public static const ATLAS_XML_NAME = "atlas_0.xml";

    public static function getXMLName(id : String) : String
    {
        return EMITTER_NAME_PREFIX + id + ".xml";
    }

    public static function getParticleSnapshotName(id : String) : String
    {
        return "emitterSnapshot_" + id + ".bytearray";
    }

    public static function isEmitterXMLName(filename : String) : Boolean
    {
        return (filename.substr(0,16) == EMITTER_NAME_PREFIX)
    }

    public static function getEmitterID(XMLFilename : String) : String
    {
        return XMLFilename.substr(16).split(".")[0];
    }

    // Returns the prefix for all textures used by emitterId in the atlas.
    public static function getSubTexturePrefix(emitterId : String) : String
    {
        return "emitter_" + emitterId + "_image_";
    }

    // Returns names for subTextures .sde files.
    public static function getSubTextureName(emitterId : String, imageNumber : uint, numberOfImagesInAtlas : uint) : String
    {
        return getSubTexturePrefix(emitterId) + intToSortableStr(imageNumber, numberOfImagesInAtlas);
    }

    /**
     *   Convert an integer to a string that can be sorted with Array.CASEINSENSITIVE
     *   @param val Integer to convert
     *   @param maxValue Maximum value of integers that will be sorted
     *   @return The sortable string
     *   @author Jackson Dunstan, JacksonDunstan.com
     */
    private static function intToSortableStr(val:uint, maxValue:uint): String
    {
        // Get the number of digits in the string and the value of the most-significant digit
        var digitValue:uint = 1;
        var digits:uint = 0;
        while (maxValue /= 10)
        {
            digits++;
            digitValue *= 10;
        }
        digitValue /= 10;

        // Build the string from most-significant to least-significant digit
        var ret:String = "";
        for (var i:uint = 0; i < digits; ++i)
        {
            var digit:int = val / digitValue;
            ret += digit;
            val -= digit * digitValue;
            digitValue /= 10;
        }
        return ret;
    }
}
}
