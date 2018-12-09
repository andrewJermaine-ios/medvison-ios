//
//  ReasonArrays.swift
//  MV
//
//  Created by Andrew on 9/16/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import Foundation

class Arrays: NSObject {
    
    static let instance = Arrays()
    
  //  var allergyReasonArray = [Reason]()
   // var dentistReasonArray = [Reason]()
    //var acupuncturistReasonArray = [Reason]()
    var audiologistReasonArray = [Reason]()
    var cardiologistReasonArray = [Reason]()
    var cardiothoracicSurgeonReasonArray = [Reason]()
    var chiropractorReasonArray = [Reason]()
    var colorectalSurgeonArray = [Reason]()
    var dermatologistReasonArray = [Reason]()
    var dietitianNutritionistReasonArray = [Reason]()
    var earNoseThroatDoctorArray = [Reason]()
    var endocrinologistReasonArray = [Reason]()
    var eyeDoctorReasonArray = [Reason]()
    var gastroenterologistReasonArray = [Reason]()
    var geriatricianReasonArray = [Reason]()
    var hearingSpecialistReasonArray = [Reason]()
    var hermatologistReasonArray = [Reason]()
    var infectiousDiseaseSpecialistReasonArray = [Reason]()
    var infertilitySpecialistReasonArray = [Reason]()
    var midwifeReasonArray = [Reason]()
    var naturopathicDoctorReasonArray = [Reason]()
    var nephrologistReasonArray = [Reason]()
    var neurologistReasonArray = [Reason]()
    var neurosurgeonReasonArray = [Reason]()
    var obgynReasonArray = [Reason]()
    var oncologistReasonArray = [Reason]()
    var ophthalmologistReasonArray = [Reason]()
    var optometristReasonArray = [Reason]()
    var oralsurgeonReasonArray = [Reason]()
    var orthodontistReasonArray = [Reason]()
    var orthopedicsurgeonReasonArray = [Reason]()
    var painManagementSpecialistResaonArray = [Reason]()
    var pediatrictDentistReasonArray = [Reason]()
    var pediatritianReasonArray = [Reason]()
    var physiatristReasonArray = [Reason]()
    var physicaltherapistReasonArray = [Reason]()
    var plasticsurgeonReasonArray = [Reason]()
    var podiatristResasonArray = [Reason]()
    var primaryCareDoctorReasonArray = [Reason]()
    var prosthodontistReasonArray = [Reason]()
    var psychiatristReasonArray = [Reason]()
    var pyschologistReasonArray = [Reason]()
    var pulmonologistReasonArray = [Reason]()
    var radiologistReasonArray = [Reason]()
    var rheumatologistReasonArray = [Reason]()
    var sleepMedicineSpecialistReasonArray = [Reason]()
    var sportsMedicineSpecialistReasonArray = [Reason]()
    var surgeonReasonArray = [Reason]()
    var therapistCounselorReasonArray = [Reason]()
    var urgentCareSpecialistReasonArray = [Reason]()
    var urologicalSurgeonReasonArray = [Reason]()
    var urologistReasonArray = [Reason]()
    var vascularSurgeonReasonArray = [Reason]()
        
    
    let doctorArray = [
    
         Doctor(doctorName: "Raplhael Mirchou"),
         Doctor(doctorName: "Doctor Two"),
         Doctor(doctorName: "Doctor Three"),
         Doctor(doctorName: "Doctor Four"),
         Doctor(doctorName: "Doctor Five"),
         Doctor(doctorName: "Doctor Six"),
         Doctor(doctorName: "Doctor Seven"),
         Doctor(doctorName: "Doctor Eight"),
         Doctor(doctorName: "Doctor Nine"),
         
        
    ]
    
    let specialtiesArray = [
        
        Specialty(specialty:"Primary Care"),
        Specialty(specialty:"Secondary Care?"),
        Specialty(specialty:"Dentist"),
        Specialty(specialty:"Dermatologist"),
        Specialty(specialty:"Optometrist"),
        Specialty(specialty:"OB-GYN"),
        Specialty(specialty:"Allergist"),
        Specialty(specialty:"Acupuncturist"),
        Specialty(specialty:"Audiologist"),
        Specialty(specialty:"Cardiologist"),
        Specialty(specialty:"Cardiotharacic Surgeon"),
        Specialty(specialty:"Chirpractor"),
        Specialty(specialty:"Colorectal Surgeon"),
        Specialty(specialty:"Dietitian/Nutritionist"),
        Specialty(specialty:"Ear/Nose & Throat Doctor"),
        Specialty(specialty:"Endocrinologist"),
        Specialty(specialty:"Eye Doctor"),
        Specialty(specialty:"Gastoenterologist"),
        Specialty(specialty:"Geritrician"),
        Specialty(specialty:"Hearing Specialist"),
        Specialty(specialty:"Hermatologist"),
        Specialty(specialty:"Infectous Diease Specialist"),
        Specialty(specialty:"Infertility Specialist"),
        Specialty(specialty:"Midwife"),
        Specialty(specialty:"Naturopathic Doctor"),
        Specialty(specialty:"Nephrologist"),
        Specialty(specialty:"Neurologist"),
        Specialty(specialty:"Neruosurgeon"),
        Specialty(specialty:"Oncologist"),
        Specialty(specialty:"Ophthalmologist"),
        Specialty(specialty:"Oral Surgeon"),
        Specialty(specialty:"Orthodontist"),
        Specialty(specialty:"Orthopedic Surgeon"),
        Specialty(specialty:"Pain Management Specialist"),
        Specialty(specialty:"Pediatric Dentist"),
        Specialty(specialty:"Pediatrition"),
        Specialty(specialty:"Physiatrist"),
        Specialty(specialty:"Physical Therapist"),
        Specialty(specialty:"Plastic Surgeon"),
        Specialty(specialty:"Podiatrist"),
        Specialty(specialty:"Prosthodontist"),
        Specialty(specialty:"Psychiatrist"),
        Specialty(specialty:"Psychologist"),
        Specialty(specialty:"Pulmonologist"),
        Specialty(specialty:"Radiologist"),
        Specialty(specialty:"Rheumatologist"),
        Specialty(specialty:"Sleep Medicine Specialist"),
        Specialty(specialty:"Sports Medicine Specialist")
        
    ]
    
let allergyReasonArray = [
    Reason(reason: "Allergy Consultation"),
    Reason(reason: "Allergy Follow up"),
    Reason(reason: "Allergic Asthma"),
    Reason(reason: "Allergic Asthma"),
    Reason(reason: "Allergic Cough"),
    Reason(reason: "Allergic Eye Problems"),
    Reason(reason: "Allergic Laryngitis"),
    Reason(reason: "Allergic Reaction"),
    Reason(reason: "Anaphylaxis / Allergy"),
    Reason(reason: "Drug Allergy"),
    Reason(reason: "Eczema"),
    Reason(reason: "Food Intolerence / Allergy"),
    Reason(reason: "Hay Fever /Seasonal Allergies"),
    Reason(reason: "Hives"),
    Reason(reason: "Immunodeficiency Consultation"),
    Reason(reason: "Nasal Allergies"),
    Reason(reason: "Poison Ivy or Poison Oak"),
    Reason(reason: "Pollen Allergy"),
    Reason(reason: "Rash"),
    Reason(reason: "Skin Allergy"),
    Reason(reason: "Urticarina and Angioedema"),
    Reason(reason: "Vaccine Allergy")
]
        
let dentistReasonArray = [
    Reason(reason: "Dental Consultation"),
    Reason(reason: "Dental Follow Up"),
    Reason(reason: "Dental Cleaning"),
    Reason(reason: "Dental Emergency"),
    Reason(reason: "Amalgam Removal Consultation"),
    Reason(reason: "Bridge"),
    Reason(reason: "Caries Risk Assessment"),
    Reason(reason: "Cavities"),
    Reason(reason: "Crown"),
    Reason(reason: "Dental Implants"),
    Reason(reason: "Dental Surgery"),
    Reason(reason: "Dentures"),
    Reason(reason: "Filling"),
    Reason(reason: "Fluoride Treatment"),
    Reason(reason: "Gum Inflamation / Gingivitis"),
    Reason(reason: "Gum Surgery"),
    Reason(reason: "Implant(s)"),
    Reason(reason: "Internal Sinus Lift"),
    Reason(reason: "Invisible Braecs / Invisalign Consultation"),
    Reason(reason: "Laser Dental Treatment"),
    Reason(reason: "New Patient Dental Exam (Adult)"),
    Reason(reason: "New Patient Dental Exam (Child)"),
    Reason(reason: "Obstructive Sleep Apnea"),
    Reason(reason: "Oral Appliance Therapy"),
    Reason(reason: "Periodontal Installation"),
    Reason(reason: "Root Canal"),
    Reason(reason: "Sedation Dentistry"),
    Reason(reason: "Sensitivec Teeth"),
    Reason(reason: "Sleep Apnea"),
    Reason(reason: "Sleep Apnea / Snoring Device"),
    Reason(reason: "Teeth Whitening"),
    Reason(reason: "Thumb / Pacifier Habit Counseling"),
    Reason(reason: "Tooth Decay"),
    Reason(reason: "Tooth Extraction"),
    Reason(reason: "Toothache"),
    Reason(reason: "Veneer(s)"),
    Reason(reason: "Wisdom Tooth Problem"),
]
        
let acupuncturistReasonArray = [
    Reason(reason: "Acupuncture"),
    Reason(reason: "Acupressure"),
    Reason(reason: "Acupuncture/Chinese Medicine Consultation"),
    Reason(reason: "Acupuncture/Chinese Medicine Follow Up"),
    Reason(reason: "Bloodletting"),
    Reason(reason: "Chinese Medicine Massage/Tui Na"),
    Reason(reason: "Moxibustion"),
]
    
    
 let citiesArray = [
    Cities(city: "Boulder City, NV"),
    Cities(city: "Carson City, NV"),
    Cities(city: "Elko, NV"),
    Cities(city: "Ely, NV"),
    Cities(city: "Fallon, NV"),
    Cities(city: "Geona, NV"),
    Cities(city: "GoldField, NV"),
    Cities(city: "Henderson, NV"),
    Cities(city: "Las Vegas, NV"),
    Cities(city: "North Las Vegas, NV"),
    Cities(city: "Reno, NV"),
    Cities(city: "Sparks, NV"),
    Cities(city: "Virginia City, NV"),
    Cities(city: "Winnemucca, NV")
    ]

 let insuranceTypeArray = [
    InsuranceTypes(type: "Access Dental"),
    InsuranceTypes(type: "ADN Administrators"),
    InsuranceTypes(type: "Advantica"),
    InsuranceTypes(type: "Aetna"),
    InsuranceTypes(type: "Affinity Health Plan"),
    InsuranceTypes(type: "Aflac"),
    InsuranceTypes(type: "AIG"),
    InsuranceTypes(type: "Alameda Alliance For Health"),
    InsuranceTypes(type: "Alignment Health Plan"),
    InsuranceTypes(type: "Alpha Dental"),
    InsuranceTypes(type: "Altus Dental"),
    InsuranceTypes(type: "AlwaysCare"),
    InsuranceTypes(type: "AmeriGroup"),
    InsuranceTypes(type: "AmeriPlan")
    ]

}
