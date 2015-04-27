package com.funkypandagame.stardustplayer {

public class SDEConstants
{

    private static const EMITTER_NAME_PREFIX : String = "stardustEmitter_";
    private static const ATLAS_NAME_PREFIX : String = "atlas_";

    public static function getXMLName(id : int) : String
    {
        return EMITTER_NAME_PREFIX + id + ".xml";
    }

    public static function getImageName(id : int) : String
    {
        return "emitterImage_" + id + ".png";
    }

    public static function getAtlasName(id : int) : String
    {
        return "atlas_" + id + ".png";
    }

    public static function getAtlasXMLName(id : int) : String
    {
        return "atlas_" + id + ".xml";
    }

    public static function getParticleSnapshotName(id : int) : String
    {
        return "emitterSnapshot_" + id + ".bytearray";
    }

    public static function isEmitterXMLName(filename : String) : Boolean
    {
        return (filename.substr(0,16) == EMITTER_NAME_PREFIX)
    }

    public static function getEmitterID(XMLFilename : String) : uint
    {
        return parseInt(XMLFilename.substr(16).split(".")[0]);
    }

    public static function isAtlasImageName(filename : String) : Boolean
    {
        return (filename.substr(0,6) == ATLAS_NAME_PREFIX &&
                filename.substr(filename.length - 4, filename.length) == ".png");
    }

    // the names of the subtextures in the atlas
    public static function getSubTexturePrefix(emitterId : uint) : String
    {
        return "emitter_" + emitterId + "_image_";
    }

    /**
     *   Convert an integer to a string that can be sorted with Array.CASEINSENSITIVE
     *   @param val Integer to convert
     *   @param maxValue Maximum value of integers that will be sorted
     *   @return The sortable string
     *   @author Jackson Dunstan, JacksonDunstan.com
     */
    public static function intToSortableStr(val:uint, maxValue:uint): String
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
        for (var i:uint; i < digits; ++i)
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
