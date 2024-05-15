<?php

namespace App\Livewire\Ntipogiros;

use App\Livewire\Forms\NtipogiroForm;
use App\Models\Ntipogiro;
use Livewire\Attributes\Layout;
use Livewire\Component;

class Edit extends Component
{
    public NtipogiroForm $form;

    public function mount(Ntipogiro $ntipogiro)
    {
        $this->form->setNtipogiroModel($ntipogiro);
    }

    public function save()
    {
        $this->form->update();

        return $this->redirectRoute('ntipogiros.index', navigate: true);
    }

    #[Layout('layouts.app')]
    public function render()
    {
        return view('livewire.ntipogiro.edit');
    }
}
