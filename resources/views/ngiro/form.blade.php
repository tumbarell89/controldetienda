<div class="space-y-6">
    
    <div>
        <x-input-label for="denominacion" :value="__('Denominacion')"/>
        <x-text-input id="denominacion" name="denominacion" type="text" class="mt-1 block w-full" :value="old('denominacion', $ngiro?->denominacion)" autocomplete="denominacion" placeholder="Denominacion"/>
        <x-input-error class="mt-2" :messages="$errors->get('denominacion')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>