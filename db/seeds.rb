UserRole.delete_all
Gender.delete_all
Group.delete_all
Language.delete_all
SkillLevel.delete_all
ComputerSkillList.delete_all
ProffesionalSkillList.delete_all

UserRole.create(name: 'student')
UserRole.create(name: 'teacher')
UserRole.create(name: 'admin')

Gender.create(name: 'male')
Gender.create(name: 'female')

Group.create(name: 'COM-17a')
Group.create(name: 'COM-17b')

Group.create(name: 'COM-16a')
Group.create(name: 'COM-16b')

Group.create(name: 'COM-15a')
Group.create(name: 'COM-15b')

Group.create(name: 'COM-14b')

Language.create(language: 'ru')
Language.create(language: 'en')
Language.create(language: 'kg')

SkillLevel.create(level: 'pro')
SkillLevel.create(level: 'middle')
SkillLevel.create(level: 'junior')

ComputerSkillList.create(comp_skill: 'git')
ComputerSkillList.create(comp_skill: 'linux')
ComputerSkillList.create(comp_skill: 'terminal')

ProffesionalSkillList.create(proff_skill: 'Ruby')
ProffesionalSkillList.create(proff_skill: 'Java')
ProffesionalSkillList.create(proff_skill: 'Javascript')

Curriculum.create(name: "First",period: "spring")
Curriculum.create(name: "First",period: "fall")


Curriculum.create(name: "Second",period: "spring")
Curriculum.create(name: "Second",period: "fall")

Curriculum.create(name: "Third",period: "spring")
Curriculum.create(name: "Third",period: "fall")

Curriculum.create(name: "Four",period: "spring")
Curriculum.create(name: "Four",period: "fall")

#
Subject.create(curriculum_id: 1,code: "CS100",name: "Introduction to Engineering & CS",credit: 4,hours:4 )
Subject.create(curriculum_id: 1,code: "CS101",name: "Programming Languages - 1 ",credit: 6,hours:4 )
Subject.create(curriculum_id: 1,code: "CS103",name: "Calculus - 1",credit: 4,hours:4 )
Subject.create(curriculum_id: 1,code: "CS105",name: "Physics",credit: 4,hours:4 )



Subject.create(curriculum_id: 2,code: "CS102",name: "PL-2",credit: 4,hours:4 )
Subject.create(curriculum_id: 2,code: "CS108",name: "Math & Logic",credit: 6,hours:4 )
Subject.create(curriculum_id: 2,code: "CS104",name: "Calculus-2",credit: 4,hours:4 )
Subject.create(curriculum_id: 2,code: "CS106",name: "Physics-2",credit: 4,hours:4 )


Subject.create(curriculum_id: 3,code: "CS201",name: "OOP",credit: 4,hours:4 )
Subject.create(curriculum_id: 3,code: "CS203",name: "Web Tech",credit: 5,hours:4 )
Subject.create(curriculum_id: 3,code: "CS205",name: "Database Systems",credit: 6,hours:4 )
Subject.create(curriculum_id: 3,code: "CS207",name: "Discrete Math",credit: 2,hours:2 )


Subject.create(curriculum_id: 4,code: "CS202",name: "Data Structures",credit: 4,hours:4 )
Subject.create(curriculum_id: 4,code: "CS204",name: "Web Programming",credit: 6,hours:4 )
Subject.create(curriculum_id: 4,code: "CS206",name: "Electrotechnics and Electronics",credit: 6,hours:4 )
Subject.create(curriculum_id: 4,code: "CS208",name: "Linear Algebra",credit: 6,hours: 4 )

Subject.create(curriculum_id: 5,code: "CS301",name: "Design & Analyse",credit: 6,hours:4 )
Subject.create(curriculum_id: 5,code: "CS303",name: "Comp.Network & Telecom",credit: 6,hours:3 )
Subject.create(curriculum_id: 5,code: "CS305",name: "Software-1",credit: 4,hours:4 )
Subject.create(curriculum_id: 5,code: "CS307",name: "Digital Electronics",credit: 6,hours: 3 )

Subject.create(curriculum_id: 6,code: "CS302",name: "AI",credit: 6,hours:4 )
Subject.create(curriculum_id: 6,code: "CS304",name: "OS",credit: 6,hours:4 )
Subject.create(curriculum_id: 6,code: "CS306",name: "Software-2",credit: 4,hours:4 )
Subject.create(curriculum_id: 6,code: "CS308",name: "Comp Org & Arch",credit: 6,hours: 3 )

Subject.create(curriculum_id: 7,code: "CS401",name: "Information Sec",credit: 6,hours:3 )
Subject.create(curriculum_id: 7,code: "CS403",name: "Theory of Computation",credit: 4,hours:4 )
Subject.create(curriculum_id: 7,code: "CS405",name: "Mobile App",credit: 5,hours:4 )
Subject.create(curriculum_id: 7,code: "CS407",name: "Art & Design",credit: 2,hours: 2 )

Subject.create(curriculum_id: 8,code: "CS402",name: "Human Computer Interaction",credit: 3,hours:3 )
Subject.create(curriculum_id: 8,code: "CS404",name: "Robotics",credit: 4,hours:4 )
Subject.create(curriculum_id: 8,code: "CS-MT",name: "Metrology Standard & Certification",credit: 4,hours:2 )
Subject.create(curriculum_id: 8,code: "CS-430",name: "Thesis Diploma",credit: 15,hours: 0 )


Week.create(name: "Monday")
Week.create(name: "Tuesday")
Week.create(name: "Wednesday")
Week.create(name: "Thursday")
Week.create(name: "Friday")
Week.create(name: "Saturday")

Location.create(name: "Lab1")
Location.create(name: "Lab2")
Location.create(name: "Lab3")
Location.create(name: "Lab4")
Location.create(name: "201")
Location.create(name: "202")
Location.create(name: "203")
Location.create(name: "204")
Location.create(name: "205")
Location.create(name: "206")














#
