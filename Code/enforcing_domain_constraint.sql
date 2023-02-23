SELECT 
 communityName
,state
,countyCode
,communityCode
,CAST([population] AS INT) AS [population]
,CAST(householdsize AS decimal(5,2)) AS householsize
,CAST(racepctblack AS DECIMAL(5,2)) AS racepctblack
,CAST(racePctWhite AS DECIMAL(5,2)) AS racePctWhite
,CAST(racePctAsian AS DECIMAL(5,2)) AS racePctAsian
,CAST(racePctHisp AS DECIMAL(5,2)) AS racePctHisp
,CAST(agePct12t21 AS DECIMAL(5,2)) AS agePct12t21
,CAST(agePct12t29 AS DECIMAL(5,2)) AS agePct12t29
,CAST(agePct16t24 AS DECIMAL(5,2)) AS agePct16t24
,CAST(agePct65up AS DECIMAL(5,2)) AS agePct65up
,CAST(numbUrban AS INT) AS numbUrban
,CAST(pctUrban AS DECIMAL(5,2)) AS pctUrban
,CAST(medIncome AS INT) AS medIncome
,CAST(pctWWage AS DECIMAL(5,2)) AS pctWWage
,CAST(pctWFarmSelf AS DECIMAL(5,2)) AS pctWFarmSelf
,CAST(pctWInvInc AS DECIMAL(5,2)) AS pctWInvInc
,CAST(pctWSocSec AS DECIMAL(5,2)) AS pctWSocSec
,CAST(pctWPubAsst AS DECIMAL(5,2)) AS pctWPubAsst
,CAST(pctWRetire AS DECIMAL(5,2)) AS pctWRetire
,CAST(medFamInc AS INT) AS medFamInc
,CAST(perCapInc AS INT) AS perCapInc
,CAST(whitePerCap AS INT) AS whitePerCap
,CAST(blackPerCap AS INT) AS blackPerCap
,CAST(indianPerCap AS INT) AS indianPerCap
,CAST(AsianPerCap AS INT) AS AsianPerCap
,CAST(OtherPerCap AS INT) AS OtherPerCap
,CAST(HispPerCap AS INT) AS HispPerCap
,CAST(NumUnderPov AS INT) AS NumUnderPov
,CAST(PctPopUnderPov AS DECIMAL(5,2)) AS PctPopUnderPov
,CAST(PctLess9thGrade AS DECIMAL(5,2)) AS PctLess9thGrade
,CAST(PctNotHSGrad AS DECIMAL(5,2)) AS PctNotHSGrad
,CAST(PctBSorMore AS DECIMAL(5,2)) AS PctBSorMore
,CAST(PctUnemployed AS DECIMAL(5,2)) AS PctUnemployed
,CAST(PctEmploy AS DECIMAL(5,2)) AS PctEmploy
,CAST(PctEmplManu AS DECIMAL(5,2)) AS PctEmplManu
,CAST(PctEmplProfServ AS DECIMAL(5,2)) AS PctEmplProfServ
,CAST(PctOccupManu AS DECIMAL(5,2)) AS PctOccupManu
,CAST(PctOccupMgmtProf AS DECIMAL(5,2)) AS PctOccupMgmtProf
,CAST(MalePctDivorce AS DECIMAL(5,2)) AS MalePctDivorce
,CAST(MalePctNevMarr AS DECIMAL(5,2)) AS MalePctNevMarr
,CAST(FemalePctDiv AS DECIMAL(5,2)) AS FemalePctDiv
,CAST(TotalPctDiv AS DECIMAL(5,2)) AS TotalPctDiv
,CAST(PersPerFam AS DECIMAL(5,2)) AS PersPerFam
,CAST(PctFam2Par AS DECIMAL(5,2)) AS PctFam2Par
,CAST(PctKids2Par AS DECIMAL(5,2)) AS PctKids2Par
,CAST(PctYoungKids2Par AS DECIMAL(5,2)) AS PctYoungKids2Par
,CAST(PctTeen2Par AS DECIMAL(5,2)) AS PctTeen2Par
,CAST(PctWorkMomYoungKids AS DECIMAL(5,2)) AS PctWorkMomYoungKids
,CAST(PctWorkMom AS DECIMAL(5,2)) AS PctWorkMom
,CAST(NumKidsBornNeverMar AS INT) AS NumKidsBornNeverMar
,CAST(PctKidsBornNeverMar AS DECIMAL(5,2)) AS PctKidsBornNeverMar
,CAST(NumImmig AS INT) AS NumImmig
,CAST(PctImmigRecent AS DECIMAL(5,2)) AS PctImmigRecent
,CAST(PctImmigRec5 AS DECIMAL(5,2)) AS PctImmigRec5
,CAST(PctImmigRec8 AS DECIMAL(5,2)) AS PctImmigRec8
,CAST(PctImmigRec10 AS DECIMAL(5,2)) AS PctImmigRec10
,CAST(PctRecentImmig AS DECIMAL(5,2)) AS PctRecentImmig
,CAST(PctRecImmig5 AS DECIMAL(5,2)) AS PctRecImmig5
,CAST(PctRecImmig8 AS DECIMAL(5,2)) AS PctRecImmig8
,CAST(PctRecImmig10 AS DECIMAL(5,2)) AS PctRecImmig10
,CAST(PctSpeakEnglOnly AS DECIMAL(5,2)) AS PctSpeakEnglOnly
,CAST(PctNotSpeakEnglWell AS DECIMAL(5,2)) AS PctNotSpeakEnglWell
,CAST(PctLargHouseFam AS DECIMAL(5,2)) AS PctLargHouseFam
,CAST(PctLargHouseOccup AS DECIMAL(5,2)) AS PctLargHouseOccup
,CAST(PersPerOccupHous AS decimal(5,2)) AS PersPerOccupHous
,CAST(PersPerOwnOccHous AS decimal(5,2)) AS PersPerOwnOccHous
,CAST(PersPerRentOccHous AS decimal(5,2)) AS PersPerRentOccHous
,CAST(PctPersOwnOccup AS DECIMAL(5,2)) AS PctPersOwnOccup
,CAST(PctPersDenseHous AS DECIMAL(5,2)) AS PctPersDenseHous
,CAST(PctHousLess3BR AS DECIMAL(5,2)) AS PctHousLess3BR
,CAST(MedNumBR AS INT) AS MedNumBR
,CAST(HousVacant AS INT) AS HousVacant
,CAST(PctHousOccup AS DECIMAL(5,2)) AS PctHousOccup
,CAST(PctHousOwnOcc AS DECIMAL(5,2)) AS PctHousOwnOcc
,CAST(PctVacantBoarded AS DECIMAL(5,2)) AS PctVacantBoarded
,CAST(PctVacMore6Mos AS DECIMAL(5,2)) AS PctVacMore6Mos
,CAST(MedYrHousBuilt AS INT) AS MedYrHousBuilt
,CAST(PctHousNoPhone AS DECIMAL(5,2)) AS PctHousNoPhone
,CAST(PctWOFullPlumb AS DECIMAL(5,2)) AS PctWOFullPlumb
,CAST(OwnOccLowQuart AS INT) AS OwnOccLowQuart
,CAST(OwnOccMedVal AS INT) AS OwnOccMedVal
,CAST(OwnOccHiQuart AS INT) AS OwnOccHiQuart
,CAST(OwnOccQrange AS INT) AS OwnOccQrange
,CAST(RentLowQ AS INT) AS RentLowQ
,CAST(RentMedian AS INT) AS RentMedian 
,CAST(RentHighQ AS INT) AS RentHighQ
,CAST(RentQrange AS INT) AS RentQrange
,CAST(MedRent AS INT) AS MedRent
,CAST(MedRentPctHousInc AS DECIMAL(5,2)) AS MedRentPctHousInc
,CAST(MedOwnCostPctInc AS DECIMAL(5,2)) AS MedOwnCostPctInc
,CAST(MedOwnCostPctIncNoMtg AS DECIMAL(5,2)) AS MedOwnCostPctIncNoMtg
,CAST(NumInShelters AS INT) AS NumInShelters
,CAST(NumStreet AS INT) AS NumStreet
,CAST(PctForeignBorn AS DECIMAL(5,2)) AS PctForeignBorn
,CAST(PctBornSameState AS DECIMAL(5,2)) AS PctBornSameState
,CAST(PctSameHouse85 AS DECIMAL(5,2)) AS PctSameHouse85
,CAST(PctSameCity85 AS DECIMAL(5,2)) AS PctSameCity85
,CAST(PctSameState85 AS DECIMAL(5,2)) AS PctSameState85
,CAST(LemasSwornFT AS INT) AS LemasSwornFT
,CAST(LemasSwFTPerPop AS decimal(18,2)) AS LemasSwFTPerPop
,CAST(LemasSwFTFieldOps AS INT) AS LemasSwFTFieldOps
,CAST(LemasSwFTFieldPerPop AS decimal(18,2)) AS LemasSwFTFieldPerPop
,CAST(LemasTotalReq AS INT) AS LemasTotalReq
,CAST(LemasTotReqPerPop AS decimal(18,2)) AS LemasTotReqPerPop
,CAST(PolicReqPerOffic AS decimal(18,2)) AS PolicReqPerOffic
,CAST(PolicPerPop AS decimal(18,2)) AS PolicPerPop
,CAST(RacialMatchCommPol AS decimal(18,2)) AS RacialMatchCommPol
,CAST(PctPolicWhite AS DECIMAL(5,2)) AS PctPolicWhite
,CAST(PctPolicBlack AS DECIMAL(5,2)) AS PctPolicBlack
,CAST(PctPolicHisp AS DECIMAL(5,2)) AS PctPolicHisp
,CAST(PctPolicAsian AS DECIMAL(5,2)) AS PctPolicAsian
,CAST(PctPolicMinor AS DECIMAL(5,2)) AS PctPolicMinor
,CAST(OfficAssgnDrugUnits AS INT) AS OfficAssgnDrugUnits
,CAST(NumKindsDrugsSeiz AS INT) AS NumKindsDrugsSeiz
,CAST(PolicAveOTWorked AS DECIMAL(18,2)) AS PolicAveOTWorked
,CAST(LandArea AS DECIMAL(18,2)) AS LandArea
,CAST(PopDens AS DECIMAL(18,2)) AS PopDens
,CAST(PctUsePubTrans AS DECIMAL(5,2)) AS PctUsePubTrans
,CAST(PolicCars AS INT) AS PolicCars
,CAST(PolicOperBudg AS INT) AS PolicOperBudg
,CAST(LemasPctPolicOnPatr AS DECIMAL(5,2)) AS LemasPctPolicOnPatr
,CAST(LemasGangUnitDeploy AS INT) AS LemasGangUnitDeploy
,CAST(LemasPctOfficDrugUn AS DECIMAL(5,2)) AS LemasPctOfficDrugUn
,CAST(PolicBudgPerPop AS DECIMAL(18,2)) AS PolicBudgPerPop
,CAST(murders AS INT) AS murders
,CAST(murdPerPop AS DECIMAL(18,2)) AS murdPerPop
,CAST(rapes AS INT) AS rapes
,CAST(rapesPerPop AS DECIMAL(18,2)) AS rapesPerPop
,CAST(robberies AS INT) AS robberies
,CAST(robbbPerPop AS DECIMAL(18,2)) AS robbbPerPop
,CAST(assaults AS INT) AS assaults
,CAST(assaultPerPop AS DECIMAL(18,2)) AS assaultPerPop
,CAST(burglaries AS INT) AS burglaries
,CAST(burglPerPop AS DECIMAL(18,2)) AS burglPerPop
,CAST(larcenies AS INT) AS larcenies
,CAST(larcPerPop AS DECIMAL(18,2)) AS larcPerPop
,CAST(autoTheft AS INT) AS autoTheft
,CAST(autoTheftPerPop AS DECIMAL(18,2)) AS autoTheftPerPop
,CAST(arsons AS INT) AS arsons
,CAST(arsonsPerPop AS DECIMAL(18,2)) AS arsonsPerPop
,CAST(ViolentCrimesPerPop AS DECIMAL(18,2)) AS ViolentCrimesPerPop
,CAST(nonViolPerPop AS DECIMAL(18,2)) AS nonViolPerPop
,RIGHT('0'+ zip,5) AS zip
,[type]
,CAST(decommissioned AS INT) AS decommissioned
,primary_city
,acceptable_cities
,unacceptable_cities
,county
,timezone
,area_codes
,world_region
,country
,latitude
,longitude
,CAST(irs_estimated_population AS INT) AS irs_estimated_population
INTO crime_and_zip_datatype_fixed
FROM crime_and_zip_str_null_addressed
