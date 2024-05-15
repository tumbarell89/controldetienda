<div class="space-y-6">
    
    <div>
        <x-input-label for="cantidad" :value="__('Cantidad')"/>
        <x-text-input id="cantidad" name="cantidad" type="text" class="mt-1 block w-full" :value="old('cantidad', $dalmacenventa?->cantidad)" autocomplete="cantidad" placeholder="Cantidad"/>
        <x-input-error class="mt-2" :messages="$errors->get('cantidad')"/>
    </div>
    <div>
        <x-input-label for="valamcens_id" :value="__('Valamcens Id')"/>
        <x-text-input id="valamcens_id" name="valamcens_id" type="text" class="mt-1 block w-full" :value="old('valamcens_id', $dalmacenventa?->valamcens_id)" autocomplete="valamcens_id" placeholder="Valamcens Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('valamcens_id')"/>
    </div>
    <div>
        <x-input-label for="dproductos_id" :value="__('Dproductos Id')"/>
        <x-text-input id="dproductos_id" name="dproductos_id" type="text" class="mt-1 block w-full" :value="old('dproductos_id', $dalmacenventa?->dproductos_id)" autocomplete="dproductos_id" placeholder="Dproductos Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('dproductos_id')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>