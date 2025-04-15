UCLASS()
class ACircuitBreaker : AActor
{
    UPROPERTY()
    bool bIsOn=true;
    UFUNCTION(BlueprintCallable)
    void ToggleBreaker()
    {
        bIsOn=!bIsOn;
        Print("Breaker Toggle: " +(bIsOn?"On":"Off"));
    }
    UFUNCTION(BlueprintCallable)
    bool IsProvidingPower()
    {
        return bIsOn;
    }
};