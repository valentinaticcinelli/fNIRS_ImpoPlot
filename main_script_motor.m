%script to import data from file
clear all
clc

file_name='delphineMotor1.txt';


import_events_motor
import_values_motor
import_info_motor
import_labels_motor


save( [ 'delphineMotorData1.mat'], 'data')

print_channels_motor