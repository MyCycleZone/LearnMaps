//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ADOEntityFW
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public string userName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Home { get; set; }
    
        public virtual UserLocation UserLocation { get; set; }
    }
}
