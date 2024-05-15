<div class="space-y-6">
    
    <div>
        <x-input-label for="codigoconcecutivo" :value="__('Codigoconcecutivo')"/>
        <x-text-input id="codigoconcecutivo" name="codigoconcecutivo" type="text" class="mt-1 block w-full" :value="old('codigoconcecutivo', $dventa?->codigoconcecutivo)" autocomplete="codigoconcecutivo" placeholder="Codigoconcecutivo"/>
        <x-input-error class="mt-2" :messages="$errors->get('codigoconcecutivo')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>