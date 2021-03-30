# Assignment 7
Link to this [Assignment](https://github.com/ondrasouk/Digital-electronics-1/tree/main/Labs/07-ffs)  
Link to [top of repository](https://github.com/ondrasouk/Digital-electronics-1)
## 1. Preparation tasks
### 1.1 D-type flip-flop
![](https://latex.codecogs.com/svg.image?q_{n&plus;1}^D=D)  
| **D** | **Qn** | **Q(n+1)** | **Comments** |
| :-: | :-: | :-: | :-- |
| 0 | 0 | 0 | No change |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | 1 | No change |
### 1.2 JK-type flip-flop
![](https://latex.codecogs.com/svg.image?q_{n&plus;1}^{JK}=J&space;\cdot&space;\overline{Q(n)}&space;&plus;&space;\overline{K}&space;\cdot&space;Q(n))  
| **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
| :-: | :-: | :-: | :-: | :-- |
| 0 | 0 | 0 | 0 | No change |
| 0 | 0 | 1 | 1 | No change |
| 0 | 1 | 0 | 0 | Reset|
| 0 | 1 | 1 | 0 | Reset |
| 1 | 0 | 0 | 1 | Set |
| 1 | 0 | 1 | 1 | Set |
| 1 | 1 | 0 | 1 | Inverse |
| 1 | 1 | 1 | 0 | Inverse |
### 1.3 T-type flip-flop
![](https://latex.codecogs.com/svg.image?q_{n&plus;1}^{T}=T&space;\cdot&space;\overline{Q(n)}&space;&plus;&space;\overline{T}&space;\cdot&space;Q(n))  
| **T** | **Qn** | **Q(n+1)** | **Comments** |
| :-: | :-: | :-: | :-- |
| 0 | 0 | 0 | No change |
| 0 | 1 | 1 | No change |
| 1 | 0 | 1 | Inverse |
| 1 | 1 | 0 | Inverse |
## 2. D latch
### 2.1 Listing of VHDL code of the process `p_d_latch`
```VHDL
    p_d_latch : process(en,d,arst)
    begin   
        if (arst = '1') then
            q <= '0';
            q_bar <= '1';
        elsif (en = '1') then
            q <= d;
            q_bar <= not d;
        end if;
    end process p_d_latch;
```
### 2.2 Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch.vhd`
```VHDL
--------------------------------------------------------------------
    -- Enable generation process
--------------------------------------------------------------------
 p_en_gen : process
    begin
        s_en <= '0';
        wait for 22.5ns;      
        s_en <= '1';
        wait for 45ns;
        s_en <= '0';
        wait for 7.5ns;
        s_en <= '1';
        wait for 5ns;
    end process p_en_gen;
-------------------------------------------------------
    -- Reset generation process
--------------------------------------------------------------------
tb_arst : process
    begin
        s_arst <= '0';
        wait for 20 ns;
        s_arst <= '1';
        wait for 4ns;
    end process tb_arst;
--------------------------------------------------------------------
    -- Stimulus
--------------------------------------------------------------------
tb_stimulus : process
    begin
        s_d <= '1';
        wait for 20ns;   
        s_d <= '0';
        wait for 5ns;
        s_d <= '1';
        wait for 5ns;
        s_d <= '0';
        wait for 10ns;
    end process tb_stimulus;
    
tb_check : process
    begin
    wait until ((s_d = '0') and (s_en = '0') and (s_arst = '1'));
    wait for 0.4ns;
    assert (s_q = '0') and (s_q_bar = '1')
    report "Reset fault (D LOW)" severity error;
    
    wait until ((s_d = '1') and (s_en = '0') and (s_arst = '1'));
    wait for 0.4ns;  
    assert (s_q = '0') and (s_q_bar = '1')
    report "Reset fault (D HIGH)" severity error;
    
    wait until (rising_edge(s_d) and (s_en = '0') and (s_arst = '0') and (s_q = '0'));
    wait for 0.4ns; 
    assert (s_q = '0') and (s_q_bar = '1')
    report "Hold fault (Hold when EN is LOW)" severity error;
    
    wait until (falling_edge(s_d) and (s_en = '0') and (s_arst = '0') and (s_q = '1'));
    wait for 0.4ns; 
    assert (s_q = '1') and (s_q_bar = '0')
    report "Hold fault (Hold when EN is LOW)" severity error;
    
    wait until ((s_d = '1') and (s_en = '1') and (s_arst = '0'));
    wait for 0.4ns; 
    assert (s_q = '1') and (s_q_bar = '0') --transparency check
    report "Data fault" severity error;
      
    end process tb_check;
```
### 2.3 Screenshot with simulated time waveforms
![](images/sc-d-latch.png)
## 3. Flip-flops
### 3.1 Listing of VHDL code of the processes
#### 3.1.1 Listing of VHDL code of the process `p_d_ff_arst`
```VHDL

```
#### 3.1.2 Listing of VHDL code of the process `p_d_ff_rst`
```VHDL

```
#### 3.1.3 Listing of VHDL code of the process `p_jk_ff_rst`
```VHDL

```
#### 3.1.4 Listing of VHDL code of the process `p_t_ff_rst`
```VHDL

```
### 3.2 Listing of Testbench processes `clock`, `reset`, `stimulus`
#### 3.2.1 Listing of testbench for `p_d_ff_arst`
```VHDL

```
#### 3.2.2 Listing of testbench for `p_d_ff_rst`
```VHDL

```
#### 3.2.3 Listing of testbench for `p_jk_ff_rst`
```VHDL

```
#### 3.2.4 Listing of testbench for `p_t_ff_rst`
```VHDL

```
### 3.3 Screenshots with simulated time waveforms
#### 3.3.1 `p_d_ff_arst`
![](images/sc-d-async.png)
#### 3.3.2 `p_d_ff_arst`
![](images/sc-d.png)
#### 3.3.3 `p_d_ff_arst`
![](images/sc-jk.png)
#### 3.3.4 `p_d_ff_arst`
![](images/sc-t.png)
## 4. Shift register scheme
