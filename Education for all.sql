/*How much is the total donation?*/

SELECT SUM(donation) AS Total_Donations
FROM donation_data;

/*What is the total donation by gender?*/

SELECT gender,
       SUM(donation) AS sum_donations
FROM donation_data
GROUP BY gender;

/*Show the total donation and number of donations by gender*/

SELECT gender,
       SUM(donation) AS sum_donations,
	   COUNT(donation) AS Count_Donations
FROM donation_data
GROUP BY gender;

/*Total donation made by frequency of donation*/

SELECT donor_data.donation_frequency,
       SUM(donation) AS Total_Donations
FROM donation_data JOIN donor_data
USING (id)
GROUP BY donor_data.donation_frequency
ORDER BY Total_Donations DESC;

/*Total donation and number of donation by Job field*/

SELECT job_field,
       COUNT(donation) AS number_of_donations,
	   SUM(donation) AS total_donations
FROM donation_data
GROUP BY job_field
ORDER BY job_field;

/*Total donation and number of donations above $200*/

SELECT SUM(donation) AS total_donations,
       COUNT(donation) AS number_of_donations
FROM donation_data
WHERE donation > 200;

/*Total donation and number of donations below $200*/

SELECT SUM(donation) AS total_donations,
       COUNT(donation) AS numbers_of_donations
FROM donation_data
WHERE donation < 200;

/*Which top 10 states contributes the highest donations*/

SELECT state,
       SUM(donation) AS Total_Donations
FROM donation_data
GROUP BY state
ORDER BY Total_Donations DESC
LIMIT 10;

/*Which top 10 states contributes the least donations*/

SELECT state,
       SUM(donation) AS Total_Donations
FROM donation_data
GROUP BY state
ORDER BY Total_Donations
LIMIT 10;

/*What are the top 10 cars driven by the highest donors*/

SELECT donor_data.car,
       SUM(donation_data.donation) as total_donations
FROM donation_data
JOIN donor_data
USING (id)
GROUP BY donor_data.car
ORDER BY total_donations desc
LIMIT 10;