# -*- coding: utf-8 -*-
"""Rewrites the AICTE records in the national schemes pack.

The old `aicte_swanidhi` record described criteria that do not match the real
AICTE scheme. The real scheme is SWANATH. Every fact below was verified against
https://www.aicte-india.org/schemes/students-development-schemes on 2026-10-22.
"""
import json
import io

PATH = r"C:\Users\shahm\Projects\Margadarshak\margadarshak\assets\data\national\schemes.json"
SOURCE_PAGE = "https://www.aicte-india.org/schemes/students-development-schemes"
TODAY = "2026-10-22"
NSP_APPLY = "https://scholarships.gov.in/ApplicationForm/"
NSP_STUDENTS = "https://scholarships.gov.in/Students"

with io.open(PATH, "r", encoding="utf-8") as fh:
    pack = json.loads(fh.read())

records = pack if isinstance(pack, list) else pack["opportunities"]
before = len(records)

swanath = {
    "id": "aicte_swanath",
    "kind": "scholarship",
    "title": {
        "en": "AICTE SWANATH Scholarship Scheme",
        "hi": "एआईसीटीई स्वनाथ छात्रवृत्ति योजना",
        "mr": "AICTE स्वनाथ शिष्यवृत्ती योजना",
    },
    "summary": {
        "en": "Rs 50,000 a year for every year of study for technical diploma and degree students in one hard situations: an orphan, either or both parents died of Covid-19, a ward of armed forces or central paramilitary forces martyred in action, or a parent suffering a critical life-threatening disease or severely disabled serverely disabled (above 80% per RPwD Act 2016) or died in an accident.",
        "hi": "तकनीकी डिप्लोमा और डिग्री के विद्यार्थियों को हर साल 50,000 रुपये — अनाथ, माता या पिता कोविड-19 में नहीं रहे, शहीद सैनिक या पैरामिलिट्री बल के बच्चे, या पालक को जानलेवा बीमारी है या 80 प्रतिशत से अधिक दिव्यांगता (RPwD कानून 2016) या दुर्घटना में नहीं रहे।",
        "mr": "तांत्रिक डिप्लोमा आणि पदवी विद्यार्थ्यांना दरवर्षी 50,000 रुपये — अनाथ, पालक कोविड-19 मध्ये निधन, शहीद सैनिक किंवा पॉरा मिलिटरी फोर्सची मुले, किंवा पालकांना जीवघेणा आजार किंवा 80 पेक्षा जास्त अपंगत्व (RPwD कायदा 2016) किंवा अपघातात निधन.",
    },
    "officialSourceName": "All India Council for Technical Education",
    "officialSourceUrl": SOURCE_PAGE,
    "lastVerifiedAt": TODAY,
    "scope": "national",
    "categories": ["scholarship", "technical-education", "special-circumstance"],
    "careerIds": ["career_web_designer", "career_accounting", "career_electrician"],
    "amountDisclosed": True,
    "applyUrl": NSP_APPLY,
    "applySteps": [
        {
            "en": "Register once on the National Scholarship Portal (One Time Registration) with your Aadhaar, then open the application form.",
            "hi": "आधार से राष्ट्रीय छात्रवृत्ति पोर्टल पर एक बार पंजीकृत करें (One Time Registration), फिर आवेदन फॉर्म खोलें।",
            "mr": "आधारासह राष्ट्रीय शिष्यवृत्ती पोर्टलवर एकदा नोंदणी करा (One Time Registration), नंतर अर्ज फॉर्म उघडा.",
        },
        {
            "en": "Choose the scheme from AICTE and upload the proof that matches your family situation.",
            "hi": "AICTE की योजना चुनें और अपनी पारिवारिक स्थिति से जुड़ा प्रमाण अपलोड करें।",
            "mr": "AICTE ची योजना निवडा आणि तुमच्या कुटुंबाच्या परिस्थितीशी जोडलेले प्रमाण अपलोड करा.",
        },
    ],
    "eligibilityRules": [
        {
            "id": "life_situation",
            "field": "life_situation",
            "operator": "one_of",
            "values": ["orphan", "parent_covid_lost", "martyr_ward", "parent_critical_illness"],
            "reasonKey": "rule_life_situation_special",
            "isBlocking": True,
        }
    ],
    "requiredDocuments": [
        {
            "id": "family_situation_proof",
            "label": {
                "en": "Proof of the family situation",
                "hi": "पारिवारिक स्थिति का प्रमाण",
                "mr": "कुटुंबाच्या परिस्थितीचे प्रमाण",
            },
            "whereToGet": {
                "en": "A death certificate, martyr certificate, disability certificate or hospital certificate, whichever matches, from the office that issued it.",
                "hi": "मौत का प्रमाणपत्र, शहीद प्रमाणपत्र, दिव्यांगता प्रमाणपत्र या अस्पताल प्रमाणपत्र — जो भी लागू हो, जारी करने वाले कार्यालय से।",
                "mr": "मृत्यू प्रमाणपत्र, शहीद प्रमाणपत्र, अपंगत्व प्रमाणपत्र किंवा रुग्णालय प्रमाणपत्र — जे लागू असेल, जारी करणाऱ्या कार्यालयाकडून.",
            },
            "isMandatory": True,
            "careerIds": [],
        }
    ],
}

saksham = {
    "id": "aicte_saksham",
    "kind": "scholarship",
    "title": {
        "en": "AICTE SAKSHAM Scholarship for Differently Abled Students",
        "hi": "एआईसीटीई साक्षम दिव्यांग छात्रवृत्ति",
        "mr": "AICTE साक्षम अपंग विद्यार्थी शिष्यवृत्ती",
    },
    "summary": {
        "en": "For differently abled students admitted to a technical diploma or degree course in an AICTE-approved institution: Rs 50,000 a year to cover incidentals.",
        "hi": "एआईसीटीई-अनुमोदित संस्थान में तकनीकी डिप्लोमा या डिग्री में प्रवेश पाए दिव्यांग विद्यार्थियों के लिए: खर्चों के लिए हर साल 50,000 रुपये।",
        "mr": "AICTE-मान्यताप्राप्त संस्थेत तांत्रिक डिप्लोमा किंवा पदवीत प्रवेश घेतलेल्या अपंग विद्यार्थ्यांसाठी: खर्चासाठी दरवर्षी 50,000 रुपये.",
    },
    "officialSourceName": "All India Council for Technical Education",
    "officialSourceUrl": SOURCE_PAGE,
    "lastVerifiedAt": TODAY,
    "scope": "national",
    "categories": ["scholarship", "technical-education", "disability"],
    "careerIds": ["career_web_designer", "career_accounting", "career_electrician"],
    "amountDisclosed": True,
    "applyUrl": NSP_STUDENTS,
    "applySteps": [
        {
            "en": "Open the National Scholarship Portal student page and start a new application for the SAKSHAM scheme.",
            "hi": "राष्ट्रीय छात्रवृत्ति पोर्टल के विद्यार्थी पेज पर जाकर साक्षम योजना के लिए नया आवेदन शुरू करें।",
            "mr": "राष्ट्रीय शिष्यवृत्ती पोर्टलच्या विद्यार्थी पृष्ठावर जाऊन साक्षम योजनेसाठी नवीन अर्ज सुरू करा.",
        }
    ],
    "eligibilityRules": [
        {
            "id": "social_category_pwd",
            "field": "social_category",
            "operator": "one_of",
            "values": ["pwd"],
            "reasonKey": "rule_category_pwd",
            "isBlocking": True,
        }
    ],
    "requiredDocuments": [
        {
            "id": "disability_certificate",
            "label": {
                "en": "Disability certificate (UDID where available)",
                "hi": "दिव्यांगता प्रमाण पत्र (जहां उपलब्ध हो, यूडीआईडी)",
                "mr": "अपंगत्व प्रमाणपत्र (जिथे उपलब्ध तेथे यूडीआईडी)",
            },
            "whereToGet": {
                "en": "The district hospital or the disability assessment board.",
                "hi": "जिला अस्पताल या दिव्यांगता मूल्यांकन बोर्ड से।",
                "mr": "जिल्हा रुग्णालय किंवा अपंगत्व मूल्यांकन बोर्डाकडून.",
            },
            "isMandatory": True,
            "careerIds": [],
        }
    ],
}

pragati = {
    "id": "aicte_pragati",
    "kind": "scholarship",
    "title": {
        "en": "AICTE PRAGATI Scholarship for Girls",
        "hi": "एआईसीटीई प्रगति छात्रवृत्ति (बालिकाओं के लिए)",
        "mr": "AICTE प्रगती शिष्यवृत्ती (मुलींसाठी)",
    },
    "summary": {
        "en": "For meritorious girls taking admission in an AICTE approved technical institution at degree or diploma level: Rs 50,000 as incidentals each year, up to 10,000 scholarships.",
        "hi": "एआईसीटीई-अनुमोदित तकनीकी संस्थान में डिग्री या डिप्लोमा स्तर पर प्रवेश लेने वाली मेधावी लड़कियों के लिए: खर्चों के लिए हर साल 50,000 रुपये, कुल 10,000 छात्रवृत्तियां।",
        "mr": "AICTE-मान्यताप्राप्त तांत्रिक संस्थेत पदवी किंवा डिप्लोमा स्तरावर प्रवेश घेणाऱ्या गुणवत्तावान मुलींसाठी: खर्चासाठी दरवर्षी 50,000 रुपये, एकूण 10,000 शिष्यवृत्त्या.",
    },
    "officialSourceName": "All India Council for Technical Education",
    "officialSourceUrl": SOURCE_PAGE,
    "lastVerifiedAt": TODAY,
    "scope": "national",
    "categories": ["scholarship", "technical-education", "girls"],
    "careerIds": ["career_web_designer", "career_accounting", "career_electrician"],
    "amountDisclosed": True,
    "applyUrl": NSP_STUDENTS,
    "applySteps": [
        {
            "en": "Open the National Scholarship Portal student page and apply under the PRAGATI scheme after your admission is confirmed.",
            "hi": "प्रवेश आने के बाद राष्ट्रीय छात्रवृत्ति पोर्टल के विद्यार्थी पेज पर प्रगति योजना के तहत आवेदन करें।",
            "mr": "प्रवेश झाल्यावर राष्ट्रीय शिष्यवृत्ती पोर्टलच्या विद्यार्थी पृष्ठावर प्रगती योजनेंतर्गत अर्ज करा.",
        }
    ],
    "eligibilityRules": [
        {
            "id": "gender_female",
            "field": "gender",
            "operator": "equals",
            "values": ["female"],
            "reasonKey": "rule_gender_female",
            "isBlocking": True,
        }
    ],
    "requiredDocuments": [
        {
            "id": "admission_proof",
            "label": {
                "en": "Admission proof from your institution",
                "hi": "अपने संस्थान का प्रवेश प्रमाण",
                "mr": "तुमच्या संस्थेचे प्रवेश प्रमाण",
            },
            "whereToGet": {
                "en": "Your college office, once admission is confirmed.",
                "hi": "प्रवेश होने के बाद अपने कॉलेज कार्यालय से।",
                "mr": "प्रवेश निश्चित झाल्यावर तुमच्या महाविद्यालयाच्या कार्यालयातून.",
            },
            "isMandatory": True,
            "careerIds": [],
        }
    ],
}

new_records = [swanath, saksham, pragati]
index = next(i for i, r in enumerate(records) if r["id"] == "aicte_swanidhi")
records[index : index + 1] = new_records

# Guards: the product promise is that every record carries a source and a date.
for record in records:
    assert record.get("officialSourceUrl", "").startswith("http"), record["id"]
    assert record.get("lastVerifiedAt"), record["id"]
    for rule in record.get("eligibilityRules", []):
        assert rule["reasonKey"].startswith("rule_"), record["id"]

for new_record in new_records:
    assert any(r["id"] == new_record["id"] for r in records)
assert not any(r["id"] == "aicte_swanidhi" for r in records)

with io.open(PATH, "w", encoding="utf-8") as fh:
    json.dump(pack, fh, ensure_ascii=False, indent=2)
    fh.write("\n")

print("ok records=%d (was %d, index=%d)" % (len(records), before, index))
for r in (swanath, saksham, pragati):
    print("wrote", r["id"], "applyUrl=" + r["applyUrl"])
