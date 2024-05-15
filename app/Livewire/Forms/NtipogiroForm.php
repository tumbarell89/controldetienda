<?php

namespace App\Livewire\Forms;

use App\Models\Ntipogiro;
use Livewire\Form;

class NtipogiroForm extends Form
{
    public ?Ntipogiro $ntipogiroModel;
    
    public $denominacion = '';
    public $ngiros_id = '';

    public function rules(): array
    {
        return [
			'denominacion' => 'required|string',
			'ngiros_id' => 'required',
        ];
    }

    public function setNtipogiroModel(Ntipogiro $ntipogiroModel): void
    {
        $this->ntipogiroModel = $ntipogiroModel;
        
        $this->denominacion = $this->ntipogiroModel->denominacion;
        $this->ngiros_id = $this->ntipogiroModel->ngiros_id;
    }

    public function store(): void
    {
        $this->ntipogiroModel->create($this->validate());

        $this->reset();
    }

    public function update(): void
    {
        $this->ntipogiroModel->update($this->validate());

        $this->reset();
    }
}
