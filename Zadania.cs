using System;
class HelloWorld {
    static void Main(){

    // Zadanie#1
    Console.Write("Podaj liczbę : ");
    float liczba = float.Parse(Console.ReadLine());
    if((liczba % 2) == 0){
        Console.Write("Liczba jest parzysta");
    }else{
        Console.Write("Liczba jest nieparzysta");
    }
    if((Math.Floor(liczba)) == liczba){
        Console.WriteLine(" i całkowita");
    }

    /***********************************************/

    // Zadanie#2
    Console.Write("Podaj wzrost cm : ");
    int var1 = int.Parse(Console.ReadLine());
    if(var1 < 150){
        Console.WriteLine("Niski");
    }
    else if((var1 > 150) && (var1 < 170)){
        Console.WriteLine("Średni");
    }
    else if(var1 > 170){
        Console.WriteLine("Wysoki");
    }else{
        Console.WriteLine("Czy na pewno podałeś poprawna liczbę?");
    }
    
    /***********************************************/

    // Zadanie#3
    Console.Write("Podaj liczbę : ");
    float var1 = float.Parse(Console.ReadLine());
    if(var1 < 0){
        Console.WriteLine("PIERWIASTEK KWADRATOWY Z LICZBY UJEMNEJ NIE ISTNIEJE");
    }else{
        Console.WriteLine(Math.Sqrt(var1));
    }

    /***********************************************/

    // Zadanie#4
    Console.Write("Podaj ilość liczb do posortowania :");
    int var1 = int.Parse(Console.ReadLine());
    int[] tab = new int[var1];
    for(int i = 0;i < var1;++i){
        Console.Write("Wprowadź liczbę : ");
        tab[i] = int.Parse(Console.ReadLine());
    }
    Array.Sort(tab);
    Console.Write("Posortowane liczby : " + tab[0]);
    for(int i = 1;i < var1;++i){
        Console.Write(", " + tab[i]);
    }
    
    /***********************************************/

    // Zadanie#5
    Console.Write("Podaj pierwszą promień walca : ");
    float r = float.Parse(Console.ReadLine());
    Console.Write("Podaj drugą wysokość walca : ");
    float h = float.Parse(Console.ReadLine());
    if(r < 0 || h < 0){
        Console.WriteLine("Obie liczby muszą być nieujemne!!!");
    }else{
        double ppw = (2 * Math.PI * r) * (r + h);
        double obj = Math.PI * Math.Pow(r,2) * h;
        Console.WriteLine("Pole powierzchni walca : {0}",ppw);
        Console.WriteLine("Objętość walca : {0}",obj);
    }

    /***********************************************/

    // Zadanie#6
    Console.Write("Podaj współczynik a: ");
    float a = float.Parse(Console.ReadLine());
    Console.Write("Podaj współczynik b: ");
    float b = float.Parse(Console.ReadLine());
    Console.Write("Podaj współczynik c: ");
    float c = float.Parse(Console.ReadLine());
    
    double delta = Math.Pow(b,2) - 4 * a * c;
    if(delta > 0){
        double x1 = (-b - delta) / (2 * a);
        double x2 = (-b + delta) / (2 * a);
        Console.WriteLine("Rozwiązania : {0}, {1}", x1, x2);
    }else if(delta == 0){
        double x1 = -b / (2 * a);
        Console.WriteLine("Rozwiązanie : {0}", x1);
    }else{
        Console.WriteLine("Brak rozwiązań");
    }

    /***********************************************/

    // Zadanie#7
    Console.Write("Podaj jeden z operatorów logicznych('+','-','*','/') : ");
    string logOpe = Console.ReadLine();
    Console.Write("Podaj pierwszą liczbe(var1) : ");
    float var1 = int.Parse(Console.ReadLine());
    Console.Write("Podaj drugą liczbe(var2) : ");
    float var2 = int.Parse(Console.ReadLine());
    double res;
    switch(logOpe){
        case "+":
            res = var1 + var2;
            Console.WriteLine("Wynik var1 + var2 = {0}",res);
        break;
        case "-":
            res = var1 - var2;
            Console.WriteLine("Wynik var1 - var2 = {0}",res);
        break;
        case "*":
            res = var1 * var2;
            Console.WriteLine("Wynik var1 * var2 = {0}",res);
        break;
        case "/":
            res = var1 / var2;
            Console.WriteLine("Wynik var1 / var2 = {0}",res);
        break;
    }

    /***********************************************/

    // Zadanie#8
    Console.Write("Podaj rok : ");
    int year = int.Parse(Console.ReadLine());
    if((year % 4) == 0){
        Console.WriteLine("Rok({0}) jest rokiem przestępnym",year);
    }

    /***********************************************/

    // Zadanie#9
    Console.Write("Podaj pierwszą liczbe : ");
    int var1 = int.Parse(Console.ReadLine());
    Console.Write("Podaj drugą liczbe : ");
    int var2 = int.Parse(Console.ReadLine());
    Console.Write("Podaj trzecią liczbe : ");
    int var3 = int.Parse(Console.ReadLine());
    
    if(((Math.Pow(var1,2) + Math.Pow(var2,2)) == Math.Pow(var3,2))||(
        (Math.Pow(var2,2) + Math.Pow(var3,2)) == Math.Pow(var1,2))||(
        (Math.Pow(var3,2) + Math.Pow(var1,2)) == Math.Pow(var2,2))){
        Console.Write("Liczby stanowią trójkę pitagorejska");
    }else{
        Console.Write("To nie jest trójka pitagorejska");
    }

    /***********************************************/

    // Zadanie#10
    Console.Write("Podaj liczbe calkowitą : ");
    int var1 = int.Parse(Console.ReadLine());
    if(var1 < 0){
        Console.WriteLine("Błąd");
    }else if(var1 == 0){
        Console.WriteLine("Silnia({0}) : 1",var1);
    }else{
        int res = 1;
        for(int i = 1;i <= var1;i++){
                 res *= i;
        }
        Console.WriteLine("Silnia({0}) : {1}",var1,res);
    }

    /***********************************************/

    // Zadanie#11
    string var2 = " ";
    Console.Write("Podaj liczbę : ");
    int var1 = int.Parse(Console.ReadLine());
    for(int i = 2;Math.Pow(i,2) < var1;i++){
        if(var1 % i == 0){
            var2 = " nie ";
            break;
        }
    }
    Console.WriteLine("Liczba{0}jest pierwsza", var2);

    /***********************************************/

    // Zadanie#12
    int i,res;
    for(i = 0;i <= 10;i++){
        res = i * 3;
        Console.WriteLine("Wartość Funkcji 'y = 3x' dla {0} = {1}",i,res);
    }
    Console.WriteLine();
    i = 0;
    while(i < 11){
        res = i * 3;
        Console.WriteLine("Wartość Funkcji 'y = 3x' dla {0} = {1}",i,res);
        i++;
    }
    Console.WriteLine();
    i = 0;
    do{
        res = i * 3;
        Console.WriteLine("Wartość Funkcji 'y = 3x' dla {0} = {1}",i,res);
        i++;
    }while(i < 11);

    /***********************************************/

    // Zadanie#12
    int i,res = 0;
    for(i = 1;i <= 100;i++){
        res += i;
    }
    Console.WriteLine("Suma liczb z przedziału(1-100) : {0}\n",res);
    Console.WriteLine();
    i = 1;res = 0;
    while(i <= 100){
        res += i;
        i++;
    }
    Console.WriteLine("Suma liczb z przedziału(1-100) : {0}\n",res);
    Console.WriteLine();
    i = 1;res = 0;
    do{
        res += i;
        i++;
    }while(i <= 100);
    Console.WriteLine("Suma liczb z przedziału(1-100) : {0}",res);
    
    }
}