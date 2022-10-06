import subprocess
import sys
#cpus=subprocess.Popen(["cat","/proc/stat", "|", "grep", "'cpu'"])

def create_cpu_line(num):
    return f"^c#53545e^^r3,2,3,14^^c#3fd113^^r3,2,3,{int((num/100)*14)}^^f5^".replace(" ","")

def create_cpu_lines():
    porcentajes_cpu=[]
    cpus=subprocess.check_output("cat /proc/stat | grep 'cpu'|tail -n +2",shell=True,text=True)
    for i in cpus.splitlines():
        line=i.split()
        porcentaje=((int(line[1])+int(line[3]))*100) / (int(line[1])+int(line[3])+int(line[4]))
        porcentajes_cpu.append(create_cpu_line(porcentaje))
    return porcentajes_cpu

def mem_line():
    mem=subprocess.check_output("cat /proc/meminfo | head -n 1 -n 2",shell=True, text=True).split()
    total=int(mem[1])
    free=int(mem[4])
    string=f"^c#53545e^^r0,2,35,15^^c#e82b0e^^r0,2,{int((free/total)*35)},15^^f35^"
    return string

#while True:
#    cpuString="".join(create_cpu_lines())
#    test=f"xsetroot -name 'cpu [{cpuString}^f3^^d^] mem [{mem_line()}^d^] [{timeString()}] [vol]'"
#    foo=subprocess.check_output(test,shell=True)
#    time.sleep(2)
match sys.argv[1]:
    case "cpu":
        cpuString="".join(create_cpu_lines())
        cpu=f"{cpuString}^f3^^d^"
        print(cpu)
    case "mem":
        mem=f"{mem_line()}^d^"
        print(mem)
