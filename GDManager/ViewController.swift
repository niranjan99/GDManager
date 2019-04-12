//
//  ViewController.swift
//  GD_SQA
//
//  Created by Carin on 4/10/19.
//  Copyright © 2019 Carin. All rights reserved.
//

import UIKit
import Czm_GenericDevice_DataManagement
import Czm_GenericDevice_DataManagement_Interfaces
import DeviceDataManagement_Interfaces
import DeviceDataManagement

class ViewController: UIViewController {
    
    var savedPatientKey:String!
    let patientRepo = PatientRepository()
    let exPatientRepo = ExtendedPatientRepository()
    let examRepo = ExamRepository()
    let exTExamRepo = ExtendedExamRepository()
    let rawExam = RawExamRepository()
    let enPdf = EncapsulatedPdfRepository()
    let measurement = MeasurementRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setDataToPatient(){
        let patient = exPatientRepo.getInstance(entity:"ExtendedPatient")
        addExtendedPatientData(exPatient: patient as! ExtendedPatient)
    }
    
    func addExtendedPatientData(exPatient:ExtendedPatient){
        exPatient.devicePatientKey = UUID().uuidString
        exPatient.eyeColor = "Red"
        exPatient.height = "6.0"
        exPatientRepo.Save(entity: exPatient)
        let patient = patientRepo.getInstance(entity:"Patient")
        addPatientData(patient: patient as! Patient, key: exPatient.devicePatientKey!)
        
    }
    func addPatientData(patient:Patient, key:String){
        
        patient.patientKey = key
        patient.key = key
        patient.id = "1001"
        patient.issuerOfPatientId = "zeiss"
        patient.issuerOfPatientId = "zeiss_conflict1"
        patient.issuerOfPatientId = "zeiss_conflict2"
        patient.birthDate = "22/12/2019 22:21:58 PM"
        patient.sex = "M"
        patient.ethnicGroup = "sd"
        patient.isInArchive = true
        patient.comments = "sdsdfdsfsd fds f dsf dsf sd"
        patient.creationDate = "22/12/2019 22:21:58 PM"
        patient.otherPatientIds = ""
        patient.owner = UUID().uuidString
        patient.familyName = "dsfdsf"
        patient.givenName = "23esdsd"
        patient.middleName = "sdafsdf"
        patient.prefix = "prdsf"
        patient.suffix = "sdfd"
        patient.familyName_Ideographic = "familyName_Ideographic"
        patient.givenName_Ideographic = "givenName_Ideographic"
        patient.middleName_Ideographic = "middleName_Ideographic"
        patient.prefix_Ideographic = "prefix_Ideographic"
        patient.suffix_Ideographic = "suffix_Ideographic"
        patient.familyName_Phonetic = "suffix_Ideographic"
        patient.givenName_Phonetic = "givenName_Phonetic"
        patient.middleName_Phonetic = "middleName_Phonetic"
        patient.prefix_Phonetic = "prefix_Phonetic"
        patient.suffix_Phonetic = "suffix_Phonetic"
        patientRepo.Save(entity: patient)
        savedPatientKey = patient.patientKey
        
    }
    @IBAction func createPatientClick(sender: UIButton)
    {
        //Create patient
        self .setDataToPatient()
    }
    @IBAction func createExamClick(sender: UIButton)
    {
        //Create exam
        self .setDataToExam()
    }
    
    func setDataToExam(){
        
        let exam = exTExamRepo.getInstance(entity:"ExtendedExam")
        addExtendedExamData(exExam: exam as! ExtendedExam)
    }
    func addExtendedExamData(exExam:ExtendedExam)
    {
        let rawExamRepo = rawExam.getInstance(entity:"RawExam")
        let enPdfRepo = enPdf.getInstance(entity:"EncapsulatedPdf")
        let mesureRepo = measurement.getInstance(entity:"ExamMeasurement")
        
        
        let  rawExamRepos:RawExam = rawExamRepo as! RawExam
        rawExamRepos.fileName = "new raw exam"
        rawExamRepos.exExamKey = UUID().uuidString
        
        
        let  enPdfRepos:EncapsulatedPdf = enPdfRepo as! EncapsulatedPdf
        enPdfRepos.conversionType = ""
        enPdfRepos.key = rawExamRepos.exExamKey
        
        let  mesureRepos:ExamMeasurement = mesureRepo as! ExamMeasurement
        mesureRepos.key = rawExamRepos.exExamKey
        
        // ADDING TO EXAM
        exExam.deviceExamKey = rawExamRepos.exExamKey
        exExam.duration = "23.32"
        exExam.examType = "Retina scan"
        exExam.image = "No Data"
        exExam.key = savedPatientKey
        exExam.rawExam = rawExamRepos
        exExam.enPdf = enPdfRepos
        exExam.measurement = mesureRepos
        
        let exam = examRepo.getInstance(entity:"Exam")
        addExamData(exam: exam as! Exam, key: exExam.deviceExamKey!)
        
    }
    
    func addExamData(exam:Exam, key:String){
        exam.acquisitionDate = "22/12/2019 22:21:58 PM"
        exam.acquisitionNumber = "3223"
        exam.comments = "No Com"
        exam.deleteOnShutdown = ""
        exam.examKey = key
        exam.instanceNumber = "23233"
        exam.isArchived = "No"
        exam.isMetadata = "YES"
        exam.isPrivateData = "YES"
        exam.laterality = "sdf"
        exam.seriesKey = ""
        exam.sopClassUid = ""
        exam.sopInstanceUid = ""
        exam.storageCommitmentErrorCount = ""
        exam.storageCommitted = ""
        exam.xmlRetrieveData_XmlBlob = ""
        examRepo.Save(entity: exam)
    }
    
    
}

