UCLASS()
class ASwitch : AActor
{
    UPROPERTY()
    ASwitchableDevice ConnectedDevices;

    UFUNCTION(BlueprintCallable)
    void ToggleConnectedDeivces()
    {
        if(ConnectedDevices!=nullptr)
        {
            ConnectedDevices.ToggleDevice();
        }
    }
    
};