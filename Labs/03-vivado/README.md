# Assignment 3
Link to this [Assignment](https://github.com/ondrasouk/Digital-electronics-1/tree/main/Labs/03-vivado)  
Link to [top of repository](https://github.com/ondrasouk/Digital-electronics-1)
## Preparation
![](images/n4r.png)  
[Source link](https://reference.digilentinc.com/_media/reference/programmable-logic/nexys-a7/n4r.png)  
## Multiplexer
### Listing of architecture
```VHDL
architecture Behavioral of mux_2bit_4to1 is

begin

process (a_i, b_i, c_i, d_i, sel_i)
    begin
        f_o <= a_i when (sel_i = "00") else
               b_i when (sel_i = "01") else
               c_i when (sel_i = "10") else
               d_i;
    end process;

end Behavioral;
```
### Listing of stimulus process
```VHDL
     p_stimuls : process
     begin
     report "Stimulus process started" severity note;
     --init. signal
        s_a <= "11";
        s_b <= "11";
        s_c <= "11";
        s_d <= "11";
     --1.st combination
        s_sel <= "00";
            s_a <= "01";
            wait for 100 ns;
            s_a <= "10";
            wait for 100 ns;
            s_a <= "11";
     --2.nd combination
        s_sel <= "01";
            s_b <= "01";
            wait for 100 ns;
            s_b <= "10";
            wait for 100 ns;
            s_b <= "11";
     --3.rd combination
        s_sel <= "10";
            s_c <= "01";
            wait for 100 ns;
            s_c <= "10";
            wait for 100 ns;
            s_c <= "11";
     --4.th combination
        s_sel <= "11";
            s_d <= "01";
            wait for 100 ns;
            s_d <= "10";
            wait for 100 ns;
            s_d <= "11";
        report "Stimulus process ended" severity note;
        wait;
     end process p_stimuls;
```
### Screenshot of simulation
![](images/mux.png)
## Tutorial
### Project creation
![](images/sc1.png)  
Click on File > Project > New. In opened window click on Next.
![](images/sc2.png)  
First specify location of new project and then project name. Click on Next.
![](images/sc3.png)  
Select RTL Project and click on Next.
![](images/sc5.png)  
Select target and simulator language as VHDL. Click on Create File and fill filename and click on OK.  
![](images/sc4.png)  
It will look like this.  
Next up is adding constrains files, but we will only click on Next.  
![](images/sc6.png)  
Next is choosing hardware and we click on Boards and then on "Nexys A7-50T" and click on Next.
![](images/sc7.png)  
Project summary will look like this.  
Click on Finish.  
![](images/sc8.png)  
There will be another dialog window with module name, enter name and click on OK.  
You have created a new project!
### Adding source file
![](images/sc9.png)  
Click on plus in project manager or at the toolbar > Files > Add Sources. In dialog window select design source and click on Next.
![](images/sc10.png)  
Click on Create File, fill filename and click on OK and Next.
![](images/sc11.png)
Fill Entity name or add I/O ports Definitins and click on OK.
### Adding testbench file
![](images/sc12.png)
Open dialog for adding sources and select simulation sources. Click on Next.
![](images/sc13.png)  
In the next window click on Create File, fill filename and click on OK and Next.
![](images/sc14.png)  
Fill entity name and click on OK.
### Running simulation
![](images/sc15.png)  
Click on toolbar in Flow > Run Simulation > Run Behavioral Simulation
![](images/sc16.png)  
Wait for program to complete and you will see simulation output.
