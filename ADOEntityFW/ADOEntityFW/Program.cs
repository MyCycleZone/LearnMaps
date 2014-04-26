using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADOEntityFW
{
    class Program
    {
        static void Main(string[] args)
        {
            myCycleZoneEntities en = new myCycleZoneEntities();
            var email = from cs in en.Users where cs.userName == "mmjoshi79@gmail.com" 
                           select cs;
            User mathCourse = email.FirstOrDefault<User>();
            IList<User> courseList = email.ToList<User>();

            string courseName = mathCourse.FirstName.ToString();

            Console.WriteLine("Email ID: " + courseName);
        }
    }
}
