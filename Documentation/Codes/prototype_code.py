import time
import datetime
import pymysql
import RPi.GPIO as GPIO
from time import localtime, strftime

# setting variables for the LED and SENSOR
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.OUT)
GPIO.setup(4, GPIO.OUT)
GPIO.setup(26, GPIO.IN)

# variable container for counting the seconds while prof gone
seq=0


# initializing our date for today in a variable
tWday= datetime.date.today()
day_of_week= tWday.isoweekday()

#display week of the day
print("today is:")
if day_of_week == 1:
    day_of_week="mon"
    print("monday")
elif day_of_week == 2:
    day_of_week="tue"
    print("tuesday")
elif day_of_week == 3:
    day_of_week="wed"
    print("wednesday")
elif day_of_week == 4:
    day_of_week="thu"
    print("thursday")
elif day_of_week == 5:
    day_of_week="fri"
    print("friday")
elif day_of_week == 6:
    day_of_week="sat"
    print("saturday")
elif day_of_week == 7:
    day_of_week="sun"
    print("sunday")

def infinite_loop():
    while True:
        yield True
        
def suspension():
    
    cursor.execute("SELECT class_status_date from class_status;")
    data3 = cursor.fetchall()
    for row3 in data3:
        if row3[0] == c:
                    
                    #getting data class_id data 
                    cursor.execute("SELECT class_status_type_id from class_status where class_status_time_start="+str(time2)+";")
                    data4 = cursor.fetchall()
                    
                    #knowing what level of suspension
                    for row4 in data4:
                        if row4[0] == 4:
                            print("suspended SHS only")
                            
                            #example of 5 mins delay of turning off 
                            time.sleep(5)
                            
                            GPIO.output(4,False)
                            seq1=1
                            while seq1==1:
                                
                                time.sleep(1)
                                # preparing our current time of the day running inside while loop
                                HM_time = strftime(strftime('%I'+':'+'%M'+':'+'%S'+'%p', localtime()))
                                Hour_Min = str(HM_time)
                                print(Hour_Min)
                                
                                #to equal the database value of time
                                time1 = strftime(strftime('%I'+'%M'+'%S', localtime()))
                                time8 = int(time1)
                                
                                #getting values for ending suspension
                                cursor.execute("SELECT class_status_time_end from class_status;")
                                data5 = cursor.fetchall()
                                for row5 in data5:
                                    if row5[0] == time8:
                                        print("suspension over")
                                        seq1==0
                                
                            
                        elif row4[0] == 3:
    
                            print("suspended all levels")
                            time.sleep(5)
                            GPIO.output(4,False)
                            seq1=1
                            while seq1==1:
                                time.sleep(1)
                                # preparing our current time of the day running
                                HM_time = strftime(strftime('%I'+':'+'%M'+':'+'%S'+'%p', localtime()))
                                Hour_Min = str(HM_time)
                                print(Hour_Min)
                                
                                #to equal the database value of time
                                time1 = strftime(strftime('%I'+'%M'+'%S', localtime()))
                                time8 = int(time1)
                                
                                #getting values for ending suspension
                                cursor.execute("SELECT class_status_time_end from class_status;")
                                data5 = cursor.fetchall()
                                for row5 in data5:
                                    if row5[0] == time8:
                                        print("suspension over")
                                        seq1==0
                                    
                                                     
                                    



for i in infinite_loop():
    
    # preparing our current time of the day running
    HM_time = strftime(strftime('%I'+':'+'%M'+':'+'%S'+'%p', localtime()))
    Hour_Min = str(HM_time)
    print(Hour_Min)
    #date
    c=datetime.date.today()
    #to equal the database value of time
    time1 = strftime(strftime('%I'+'%M'+'%S', localtime()))
    time2 = int(time1)
    lights=0
    
    #loop interval
    time.sleep(.80)
    
    db = pymysql.connect("localhost", "admin2", "meliodas123", "iot")

    # prepare a cursor object using cursor() method
    cursor = db.cursor()
    
    suspension()
    
    #getting values for the data days
    cursor.execute("SELECT day from refsubjectofferingdtl;")
    data = cursor.fetchall()
    
    for row in data:
        
        if row[0] == day_of_week:
            
            cursor.execute("SELECT time_start from refsubjectofferingdtl;")            # query in database to get start_time attribute from ftime table
            data2 = cursor.fetchall()                                  # placing the start_time data inside a variable
            for row1 in data2:                                         # checking the start_time attribute
                
                if row1[0] == time2:
                     print("on")
                     GPIO.output(4, True)
                     lights=1
                     while lights == 1:
                          
                          # preparing our current time of the day running inside while statement
                          HM_time = strftime(strftime('%I'+':'+'%M'+':'+'%S'+'%p', localtime()))  
                          Hour_Min = str(HM_time)
                          print(Hour_Min)
                          
                          #date
                          c=datetime.date.today()
                          #to equal the database value of time
                          time1 = strftime(strftime('%I'+'%M'+'%S', localtime()))
                          time2 = int(time1)
                          
                          suspension()
                          
                          # End of Class Schedule so LED turns off
                          cursor.execute("SELECT time_end from refsubjectofferingdtl;")          # query in database to get end_time attribute from ftime table
                          data1 = cursor.fetchall()                              # placing the end_time data inside a variable
                          for row1 in data1:                                     # checking the end_time attribute
                              if row1[0] == time2:
                                 GPIO.output(4, False)                    
                                 lights=0                                        # leaving the while statement       
    
                          # Checking for heat movements to continue lights 
                          if GPIO.input(26) == 1:
                             print("Got You")
                             GPIO.output(4, True)
                             time.sleep(1)
                             seq=0
                            
                          # Checking if there is no detection  
                          if GPIO.input(26) == 0:
                              seq += 1                       
                              time.sleep(1)  
                              #Checking if there is no detection on the given amount of time to turn off lights
                              if seq == 20:
                                  n=GPIO.output(4, False)
                                  
                                  
                                  
                          
    # disconnect from server
    db.close()