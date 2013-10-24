#include  <msp430x26x.h>
#include  <stdio.h>

void main(void)
{
  FILE *f;									// Define pointer to file
  volatile unsigned int i;
  WDTCTL = WDTPW+WDTHOLD;                   // Stop watchdog timer
  P6SEL |= 0x01;                            // Enable A/D channel A0
  ADC12CTL0 = ADC12ON+SHT0_2+REFON+REF2_5V; // Turn on and set up ADC12
  ADC12CTL1 = SHP;                          // Use sampling timer
  ADC12MCTL0 = SREF_1;                      // Vr+=Vref+
  f = fopen("points.dat","w+");			// Open txt file
  fprintf(f,"\n%d",ADC12MEM0);	// Write X,Y,Z coordinates
  fclose(f); 								// Close txt file

  for ( i=0; i<0x3600; i++);                // Delay for reference start-up

  ADC12CTL0 |= ENC;                         // Enable conversions

  while (1)									// Infinte while loop
  {
    ADC12CTL0 |= ADC12SC;                   // Start conversion
    while ((ADC12IFG & BIT0)==0);
    f = fopen("points.dat","a");			// Open txt file
    fprintf(f,"%d\n",ADC12MEM0);	// Write X,Y,Z coordinates
    fclose(f); 								// Close txt file
  }
}

