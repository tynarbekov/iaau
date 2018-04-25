UserRole.delete_all
Gender.delete_all
Group.delete_all
Language.delete_all

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

ComputerSkillList.create(comp_skill: 'git')
ComputerSkillList.create(comp_skill: 'linux')
ComputerSkillList.create(comp_skill: 'terminal')
