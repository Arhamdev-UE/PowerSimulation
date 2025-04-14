UCLASS()
class AGenerator : AActor
{
   UPROPERTY()
   TArray<ACircuitBreaker> BreakerInputs;
   UPROPERTY()
   AFuelTank FuelTank;

   UPROPERTY()
   bool bIsRunning = false;
   UPROPERTY()
   bool bManualSwitchOn = false;
   UFUNCTION(BlueprintCallable)
   void ToggleGeneratorSwitch()
   {
    if(FuelTank.HasFuel()&&AreBreakerOnline())
    {
        bManualSwitchOn=!bManualSwitchOn;
        bIsRunning=bManualSwitchOn;
    }
   }
   UFUNCTION()
   bool AreBreakerOnline() const
   {
    for(ACircuitBreaker breaker : BreakerInputs)
    {
        if(!breaker.IsPowerAvailable())
        return false;
    }
    return true;
   }
   UFUNCTION(BlueprintOverride)
   void Tick(float DeltaSeconds)
   {
      if(bIsRunning)
      {
        FuelTank.ConsumeFuel(DeltaSeconds);
        if(!FuelTank.HasFuel()||!AreBreakerOnline())
        {
            bIsRunning=false;
        }
      }
   }
   UFUNCTION(BlueprintCallable)
   bool IsPowerAvailable() const 
   {
    return bIsRunning;
   }
};