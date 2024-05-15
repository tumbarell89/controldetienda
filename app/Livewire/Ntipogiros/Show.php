<?php

namespace App\Livewire\Ntipogiros;

use App\Livewire\Forms\NtipogiroForm;
use App\Models\Ntipogiro;
use Livewire\Attributes\Layout;
use Livewire\Component;

class Show extends Component
{
    public NtipogiroForm $form;

    public function mount(Ntipogiro $ntipogiro)
    {
        $this->form->setNtipogiroModel($ntipogiro);
    }

    #[Layout('layouts.app')]
    public function render()
    {
        return view('livewire.ntipogiro.show', ['ntipogiro' => $this->form->ntipogiroModel]);
    }
}
