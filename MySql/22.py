from MySQLdb import *

try:
	conn = connect('localhost','root','root','pythondb')
	print('Connection Established....')
	
	cur = conn.cursor()
	
	cur.execute('drop table if exists data')
	cur.execute('create table data(Name varchar(10) , Roll int , Age int)')
	
	while True:
		
		print('\n1. Insert Data\n2. Display Data\n3. Update Data\n4. Delete Data\n5. Exit\n')
		ch = int(input('Enter Choice :: '))
		
		if ch == 1 :
			
			query = 'insert into data values("%s","%d","%d")'
			
			name = input('Enter Name :: ')
			roll = int(input('Enter Roll No :: '))
			age = int(input('Enter Age :: '))
			
			try:
				cur.execute(query%(name,roll,age))
				conn.commit()
				print('Inserted Successfully....\n')
			except:
				conn.rollback()
					
			
		elif ch == 2 :
			
			cur.execute('select * from data')
			result = cur.fetchall()
			
			for i in result:
				print(i)
				
			
		elif ch == 3 :
			
			query = 'update data set Name = "%s" where Roll = "%d"'
			
			roll = int(input('Enter The Roll No For Which Name Is To Updated :: '))
			name = input('Enter New Name :: ')
			
			try:
				cur.execute(query%(name,roll))
				conn.commit()
				print('Updated Successfully....\n')
			except:
				conn.rollback()
			
		elif ch == 4 : 
			
			query = 'delete from data where Roll = "%d"'
			
			r = int(input('Enter The Roll No :: '))
			
			try:
				cur.execute(query%(r))
				conn.commit()
				print('Removed Successfully....\n')
				
			except:
				conn.rollback()
			
		elif ch == 5 : 
			break
			

	
except Exception as e:
	print('Exception Occured....',e)
	
finally:
	print('Closing Connection....')
	cur.close()
	conn.close()	
