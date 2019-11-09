# mongodb Connnectivity

from pymongo import *
from pprint import *
try:
	conn_obj = MongoClient()
	print('Connection Establised Successfully\n')
	db_obj = conn_obj.Institute

	coll_obj = db_obj.Student

	while True:
		print("1. Enter Data\n2. Show Data\n3. Update\n4. Delete")
		ch = int(input("\nEnter The Choice :: "))

		if ch == 1:
			n = int(input('\nTotal Entries :: '))

			for i in range(n):
				data = eval(input('Enter The Data In JSON Format :: '))
				coll_obj.insert(data)
		
		elif ch == 2:
	
			cur_obj = coll_obj.find()
		
			for i in cur_obj:
				print('\n')
				pprint(i)	

		elif ch == 3:
	
			rno = int(input("\nEnter The Roll No For Which Data is to be Updated :: "))
			name = input('Enter New Name :: ')
		
			coll_obj.update({'ROLL_NO':rno},{'$set':{'NAME':name}})
	
		elif ch == 4:
	
			rno = int(input("\nEnter The Roll No For Which Data is to be Updated :: "))
		
			coll_obj.remove({'ROLL_NO':rno})
		else:
	
			conn_obj.close()
		
			print('\nClosing The Conncection...')
			break;

except Exception as e:
	print('\nConnection Failed Due To {}'.format(e))	
