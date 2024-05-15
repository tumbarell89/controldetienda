<div class="space-y-6">
    
    <div>
        <x-input-label for="cantidad" :value="__('Cantidad')"/>
        <x-text-input id="cantidad" name="cantidad" type="text" class="mt-1 block w-full" :value="old('cantidad', $dalmaceninterno?->cantidad)" autocomplete="cantidad" placeholder="Cantidad"/>
        <x-input-error class="mt-2" :messages="$errors->get('cantidad')"/>
    </div>
    <div>
        <x-input-label for="ialmacens_id" :value="__('Ialmacens Id')"/>
        <x-text-input id="ialmacens_id" name="ialmacens_id" type="text" class="mt-1 block w-full" :value="old('ialmacens_id', $dalmaceninterno?->ialmacens_id)" autocomplete="ialmacens_id" placeholder="Ialmacens Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('ialmacens_id')"/>
    </div>
    <div>
        <x-input-label for="dproductos_id" :value="__('Dproductos Id')"/>
        <x-text-input id="dproductos_id" name="dproductos_id" type="text" class="mt-1 block w-full" :value="old('dproductos_id', $dalmaceninterno?->dproductos_id)" autocomplete="dproductos_id" placeholder="Dproductos Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('dproductos_id')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>