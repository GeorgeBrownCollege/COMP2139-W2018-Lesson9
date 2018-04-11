using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements required for EF DB Access
using COMP2139_W2018_Lesson9.Models;
using System.Web.ModelBinding;

namespace COMP2139_W2018_Lesson9
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetStudent();
            }
        }

        private void GetStudent()
        {
            // populate the form with existing data from db 
            int StudentID = Convert.ToInt32(Request.QueryString["StudentID"]);

            // connect to the EF DB 
            using(ContosoModel db = new ContosoModel())
            {
                // populate a student object instance with the StudentID from
                // the URL parameter
                Student updatedStudent = (from student in db.Students
                                          where student.StudentID == StudentID
                                          select student).FirstOrDefault();

                // map the student properties to the form control
                if(updatedStudent != null)
                {
                    LastNameTextBox.Text = updatedStudent.LastName;
                    FirstNameTextBox.Text = updatedStudent.FirstMidName;
                    EnrollmentDateTextBox.Text = updatedStudent.EnrollmentDate.ToString("yyyy-MM-dd");
                }
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Redirect back to the students page
            Response.Redirect("/Contoso/Students.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // Use EF to connect to the server
            using(ContosoModel db = new ContosoModel())
            {
                // use the student model to create a new student object and
                // save a new record in the Students Table

                Student newStudent = new Student();

                int StudentID = 0;

                if(Request.QueryString.Count > 0) // our URL has a StudentID in it
                {
                    // get the id from the URL - going to be used for Update
                    StudentID = Convert.ToInt32(Request.QueryString["StudentID"]);

                    // get the current student from EF db
                    newStudent = (from student in db.Students
                                  where student.StudentID == StudentID
                                  select student).FirstOrDefault();
                }

                // add form data to the new student object
                newStudent.LastName = LastNameTextBox.Text;
                newStudent.FirstMidName = FirstNameTextBox.Text;
                newStudent.EnrollmentDate = Convert.ToDateTime(EnrollmentDateTextBox.Text);

                // use LINQ to ADO.net to add / insert new student into the db
                if(StudentID == 0)
                {
                    db.Students.Add(newStudent);
                }

                // save our changes to the database
                db.SaveChanges();

                // Redirect back to the updated students page
                Response.Redirect("/Contoso/Students.aspx");
            }
        }
    }
}