# Assignment 1
## Part 1
1. this **repository**
2. this *README.md*:
3. styles in `Markdown`:

| **a** | **b** |**c** |
| :-: | :-: | :-: |
| 0 | 1 | 0 |
```VHDL
architecture testbench of tb_gates is

    -- Local signals
    signal s_a    : std_logic;
    signal s_b    : std_logic;
    signal s_for  : std_logic;
    signal s_fand : std_logic;
    signal s_fxor : std_logic;

begin
```
* unordered list
* test 123

[Back to top of repository](https://github.com/ondrasouk/Digital-electronics-1)
## Part 2
## Part 3
### De Morgan's law verification
![](https://latex.codecogs.com/gif.latex?f%28c%2Cb%2Ca%29%20%3D%20%5Coverline%7Bb%7D%5C%2Ca%20&plus;%20%5Coverline%7Bc%7D%5C%2C%5Coverline%7Bb%7D)

![](https://latex.codecogs.com/gif.latex?f_%7BNOR%7D%28c%2Cb%2Ca%29%20%3D%20%5Coverline%7B%5Coverline%7B%5Coverline%7Bb&plus;%5Coverline%7Ba&plus;a%7D%7D&plus;%5Coverline%7Bc&plus;b%7D%7D%7D)

![](https://latex.codecogs.com/gif.latex?f_%7BNAND%7D%28c%2Cb%2Ca%29%20%3D%20%5Coverline%7B%5Coverline%7B%5Coverline%7Bb%20%5Ccdot%20b%7D%5Ccdot%20a%7D%5C%20%5Ccdot%5C%20%5Coverline%7B%5Coverline%7Bc%5Ccdot%20c%7D%5Ccdot%5Coverline%7Bb%5Ccdot%20b%7D%7D%7D)
#### Truth table
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

#### Code of architecture

```VHDL
architecture dataflow of gates is
begin
    fo_o  <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnor_o <= ((b_i nor (a_i nor a_i)) nor (c_i nor b_i)) nor ((b_i nor (a_i nor a_i)) nor (c_i nor b_i));
    fnand_o <= (((b_i nand b_i) nand a_i) nand ((c_i nand c_i) nand (b_i nand b_i)));

end architecture dataflow;
```

#### Playground link
![link to playground](https://www.edaplayground.com/x/8Ls6)

#### Waveforms screenshot
![waveforms](images/1.jpg)

### basic Boolean postulates
#### Code of architecture

```VHDL
architecture dataflow of gates is
begin
    f1_o <= x_i and not(x_i);
    f2_o <= x_i or not(x_i);
    f3_o <= x_i or x_i or x_i;
    f4_o <= x_i and x_i and x_i;

end architecture dataflow;
```

#### Playground link
![link to playground](https://www.edaplayground.com/x/aFrh)
#### Waveforms screenshot
![waveforms](images/2.jpg)

### Distributive laws
#### Code of architecture

```VHDL
architecture dataflow of gates is
begin
    f1R_o <= (x_i and y_i) or (x_i and z_i);
    f1L_o <= x_i and (y_i or z_i);
    f2R_o <= (x_i or y_i) and (x_i or z_i);
    f2L_o <= x_i or (y_i and z_i);

end architecture dataflow;
```

#### Playground link
![link to playground](https://www.edaplayground.com/x/HZnB)
#### Waveforms screenshot
![waveforms](images/3.jpg)
