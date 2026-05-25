
-- SELECT all patients
SELECT * FROM Patient;

-- JOIN: Appointments with patient and doctor names
SELECT 
  a.AppointmentID,
  p.First_Name AS PatientName,
  d.First_Name AS DoctorName,
  a.Date,
  a.Time,
  a.Status
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID;

-- JOIN: Prescriptions with medications
SELECT 
  pr.PrescriptionID,
  p.First_Name AS PatientName,
  m.Name AS MedicationName,
  m.Dosage
FROM Prescription pr
JOIN Patient p ON pr.PatientID = p.PatientID
JOIN Prescription_Medication pm ON pr.PrescriptionID = pm.PrescriptionID
JOIN Medication m ON pm.MedicationID = m.MedicationID;

-- GROUP BY: Total payment per patient
SELECT 
  p.First_Name,
  SUM(pay.Amount) AS TotalPaid
FROM Payment pay
JOIN Patient p ON pay.PatientID = p.PatientID
GROUP BY p.First_Name;

-- SUBQUERY: Patient who paid the highest amount
SELECT 
  p.First_Name,
  pay.Amount
FROM Payment pay
JOIN Patient p ON pay.PatientID = p.PatientID
WHERE pay.Amount = (
  SELECT MAX(Amount) FROM Payment
);

-- UPDATE: Change status of an appointment
UPDATE Appointment
SET Status = 'Cancelled'
WHERE AppointmentID = 1002;

-- DELETE: Delete a prescription
DELETE FROM Prescription
WHERE PrescriptionID = 202;

-- SELECT: All cardiology doctors
SELECT * FROM Doctor
WHERE Specialization = 'Cardiology';

-- COUNT: Total number of patients
SELECT COUNT(*) AS NumberOfPatients FROM Patient;

-- SELECT: Medications and their dosages
SELECT Name, Dosage FROM Medication;
