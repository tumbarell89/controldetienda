<?php

namespace App\Livewire\Ntipogiros;

use App\Models\Ntipogiro;
use Illuminate\View\View;
use Livewire\Attributes\Layout;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    #[Layout('layouts.app')]
    public function render(): View
    {
        $ntipogiros = Ntipogiro::paginate();

        return view('livewire.ntipogiro.index', compact('ntipogiros'))
            ->with('i', $this->getPage() * $ntipogiros->perPage());
    }

    public function delete(Ntipogiro $ntipogiro)
    {
        $ntipogiro->delete();

        return $this->redirectRoute('ntipogiros.index', navigate: true);
    }
}
