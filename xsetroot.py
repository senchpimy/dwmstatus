import time 
import subprocess
#cpus=subprocess.Popen(["cat","/proc/stat", "|", "grep", "'cpu'"])

def create_cpu_line(num,space):
    return f"^c#53545e^^r3,2,3,14^ ^c#3fd113^^r{space*3},2,3,{int((num/100)*14)}^^f5^".replace(" ","")

def create_cpu_lines():
    porcentajes_cpu=[]
    cpus=subprocess.check_output("cat /proc/stat | grep 'cpu'|tail -n +2",shell=True,text=True)
    j=1
    for i in cpus.splitlines():
        line=i.split()
        porcentaje=((int(line[1])+int(line[3]))*100) / (int(line[1])+int(line[3])+int(line[4]))
        porcentajes_cpu.append(create_cpu_line(porcentaje,j))
        j=1+j
    return porcentajes_cpu

def mem_line():
    mem=subprocess.check_output("cat /proc/meminfo | head -n 1 -n 2",shell=True, text=True).split()
    total=int(mem[1])
    free=int(mem[4])
    string=f"^c#53545e^^r0,2,35,15^^c#e82b0e^^r0,2,{int((free/total)*35)},15^^f35^"
    return string

def timeString():
    timeString=subprocess.check_output("date +%I:%M",shell=True,text=True)
    return timeString

while True:
    cpuString="".join(create_cpu_lines())
    test=f"xsetroot -name 'cpu [{cpuString}^f3^^d^] mem [{mem_line()}^d^] [{timeString()}] [vol]'"
    foo=subprocess.check_output(test,shell=True)
    time.sleep(60)
