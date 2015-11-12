Describe "New-Event" {

    Context "Check return type of New-Event" {
	
        It "Should return PSEventArgs as return type of New-Event" {	    
            (New-Event -SourceIdentifier a).GetType() | Should Be System.Management.Automation.PSEventArgs
	}
    }

    Context "Check New-Event can register an event"{
	It "Should return PesterTestMessage as the MessageData" {
	    (New-Event -sourceidentifier PesterTimer -sender windows.timer -messagedata "PesterTestMessage")
	    (Get-Event -SourceIdentifier PesterTimer).MessageData  | Should Be "PesterTestMessage"
	    Remove-Event -sourceidentifier PesterTimer
	}

        It "Should return Sender as windows.timer" {
             (New-Event -sourceidentifier PesterTimer -sender windows.timer -messagedata "PesterTestMessage")
	     (Get-Event -SourceIdentifier PesterTimer).Sender  | Should be windows.timer
	    Remove-Event -sourceIdentifier PesterTimer
	}
    }
}
