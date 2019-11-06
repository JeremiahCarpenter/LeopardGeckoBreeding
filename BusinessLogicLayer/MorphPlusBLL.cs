using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class MorphPlusBLL : IEquatable<MorphPlusBLL>//morph plus is how the morphs are compared and provides the percentages
    {//Iequatable allows the creation of a custom "Equality" becaue i am comparing morphnames to see if they are equal based on their name
        public MorphPlusBLL(MorphBLL one, MorphBLL two)//all the percentages are calculated in this constructor
        {
            // one will never be null(normal), it can only be truebreed or het
            // two can be null(normal) or truebreed or het
            MorphName = one.MorphName;
            Het = one.Het;
            MorphOne = one;
            MorphTwo = two;
            // two is null = normal
            if (two == null)
            {
                // het to normal
                if (one.Het)
                {
                    PercentNormal = 50;
                    PercentHet = 50;
                    PercentTrue = 0;
                }
                // truebreed to normal
                else
                {
                    PercentNormal = 0;
                    PercentHet = 100;
                    PercentTrue = 0;
                }

            }
            else if (one.Het == two.Het)
            {
                // het to het
                if (one.Het)
                {
                    PercentNormal = 25;
                    PercentHet = 50;
                    PercentTrue = 25;
                }
                // truebreed to truebreed
                else
                {
                    PercentNormal = 0;
                    PercentHet = 0;
                    PercentTrue = 100;
                }
            }
            else
            // het to truebreed (or truebreed to het)
            {
                PercentNormal = 0;
                PercentHet = 50;
                PercentTrue = 50;
            }

        }
        public MorphBLL MorphOne;
        public MorphBLL MorphTwo;
        public string MorphName { get; set; }
        // public bool Same { get; set; }
        public bool Het { get; set; }

        public decimal PercentNormal { get; set; }
        public decimal PercentHet { get; set; }
        public decimal PercentTrue { get; set; }

        public override bool Equals(object obj)//this is where the custom equals is implemented 
        {

            MorphPlusBLL other = obj as MorphPlusBLL;//comparing between two morphs 
            if (other == null) return false;
            return other.MorphName.Equals(MorphName);
        }

        public bool Equals(MorphPlusBLL obj)//the parameter is known to be a morph in this case 
        {

            if (obj == null) return false;
            return obj.MorphName.Equals(MorphName);
        }
        public override int GetHashCode()//
        {
            return MorphName.GetHashCode();
        }

        public override string ToString()//this is converting the info to a character string for testing reasons 
        {
            char p = '\'';
            char s = ' ';
            return $"{MorphOne.MorphName}{(MorphOne.Het ? p : s)} & {MorphTwo?.MorphName ?? null}{(((MorphTwo?.Het ?? false)) ? p : s)}{MorphName,15} N:{PercentNormal,4} H:{PercentHet,4} T:{PercentTrue}";
        }

    }
}
