const int trigPin = 11; //se conecta al pin de eco en el sensor de distancia
const int echoPin = 12; //se conecta al  trigger pin en el sensor de distancia
const int redPin = 3; //pin para controlar el LED rojo dentro del LED RGB
const int greenPin = 5; //pin para controlar el LED verde dentro del LED RGB
const int bluePin = 6; //pin para controlar el LED azul dentro del LED RGB
const int buzzerPin = 10; //pin que controlará el  buzzer
float distance = 0; //macena la distancia medida por el sensor de distancia
void setup()
{
Serial.begin (9600); //configurar una conexión en serie con la computadora
pinMode(trigPin, OUTPUT); //El trigger pin emitirá impulsos de electricidad
pinMode(echoPin, INPUT); //el pin de eco medirá la duración de los pulsos que regresan del sensor de distancia
//set de los pines LED RGB para salida
pinMode(redPin, OUTPUT);
pinMode(greenPin, OUTPUT);
pinMode(bluePin, OUTPUT);
pinMode(buzzerPin, OUTPUT); //establecer el pin del buzzer para salidat
}
void loop() {
distance = getDistance(); //variable para almacenar la distancia medida por el sensor
Serial.print(distance); //imprime la distancia que se midió
Serial.println(" in"); 
aux(distance);// <--------------------------------- Funcion creada
//hacer que el LED RGB sea rojo
analogWrite(redPin, 255);
analogWrite(greenPin, 0);
analogWrite(bluePin, 0);

} else if(10 < distance && distance < 20){ //si el objeto esta a una distancia media
//hacer que el LED RGB sea amarillo
analogWrite(redPin, 255);
analogWrite(greenPin, 50);
analogWrite(bluePin, 0);
} else{ //si el objeto está muy lejos
//hacer que el LED RGB sea verde
analogWrite(redPin, 0);
analogWrite(greenPin, 255);
analogWrite(bluePin, 0);
}
delay(50); //retrasar 50 ms entre cada lectura
}
//------------------FUNCTIONS-------------------------------
//DEVUELVE LA DISTANCIA MEDIDA POR EL SENSOR DE DISTANCIA HC-SR04
float getDistance()
{
float echoTime; //variable para almacenar el tiempo que demora un ping para rebotar en un objeto
float calcualtedDistance; //variable para almacenar la distancia calculada a partir del tiempo del eco
//enviar un pulso ultrasónico de 10ms de largo
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
echoTime = pulseIn(echoPin, HIGH);
//pulso para rebotar de vuelta al sensor
calcualtedDistance = echoTime / 148.0; //calcula la distancia del objeto que refleja el pulso (la mitad del tiempo de rebote multiplicado por la velocidad del sonido)
return calcualtedDistance; //devuelve la distancia que se calculo
}
void aux(float distance){
tone(buzzerPin, distance*100); //activa el zumbador; Se toma la distancia y se multiplica *100 para que se nota la diferencia de sonidos<----------------------
delay(100); //espere 100 milisegundos<----------------------------------
noTone(buzzerPin); //apaga el zumbador // mueer el servo a 135 grados<-------------------------------
delay(100); //espere 100 milisegundos<-------------------------------------
  
  }
