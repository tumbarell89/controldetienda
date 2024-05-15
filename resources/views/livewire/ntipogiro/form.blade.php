<div class="space-y-6">
    
    <div>
        <x-input-label for="denominacion" :value="__('Denominacion')"/>
        <x-text-input wire:model="form.denominacion" id="denominacion" name="denominacion" type="text" class="mt-1 block w-full" autocomplete="denominacion" placeholder="Denominacion"/>
        @error('form.denominacion')
            <x-input-error class="mt-2" :messages="$message"/>
        @enderror
    </div>
    <div>
        <x-input-label for="ngiros_id" :value="__('Ngiros Id')"/>
        <x-text-input wire:model="form.ngiros_id" id="ngiros_id" name="ngiros_id" type="text" class="mt-1 block w-full" autocomplete="ngiros_id" placeholder="Ngiros Id"/>
        @error('form.ngiros_id')
            <x-input-error class="mt-2" :messages="$message"/>
        @enderror
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>