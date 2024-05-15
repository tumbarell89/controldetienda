<div class="space-y-6">
    
    <div>
        <x-input-label for="denominacion" :value="__('Denominacion')"/>
        <x-text-input id="denominacion" name="denominacion" type="text" class="mt-1 block w-full" :value="old('denominacion', $ntipogiro?->denominacion)" autocomplete="denominacion" placeholder="Denominacion"/>
        <x-input-error class="mt-2" :messages="$errors->get('denominacion')"/>
    </div>
    <div>
        <x-input-label for="ngiros_id" :value="__('Ngiros Id')"/>
        <x-text-input id="ngiros_id" name="ngiros_id" type="text" class="mt-1 block w-full" :value="old('ngiros_id', $ntipogiro?->ngiros_id)" autocomplete="ngiros_id" placeholder="Ngiros Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('ngiros_id')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>