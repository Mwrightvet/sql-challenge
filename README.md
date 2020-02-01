# sql-challenge

 
    Design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data.


    Inside your local git repository, create a directory for the SQL challenge. Use a folder name to correspond to the challenge: EmployeeSQL.

    Add your files to this folder.
    Push the above changes to GitHub.



Instructions

Data Modeling
Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like http://www.quickdatabasediagrams.com.

Data Engineering


Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.


Import each CSV file into the corresponding SQL table.



Data Analysis
Once you have a complete database, do the following:


List the following details of each employee: employee number, last name, first name, gender, and salary.


List employees who were hired in 1986.


List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.


List the department of each employee with the following information: employee number, last name, first name, and department name.


List all employees whose first name is "Hercules" and last names begin with "B."


List all employees in the Sales department, including their employee number, last name, first name, and department name.


List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.



Bonus (Optional)
As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:


Create a histogram to visualize the most common salary ranges for employees.


Create a bar chart of average salary by title.



Epilogue
Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

Submission


Create an image file of your ERD.


Create a .sql file of your table schemata.


Create a .sql file of your queries.


(Optional) Create a Jupyter Notebook of the bonus analysis.


Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.
