<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dsalidaalmacen
 *
 * @property $id
 * @property $factura
 * @property $precioventa
 * @property $total
 * @property $esventa
 * @property $nalmacenes_origen_id
 * @property $nalmacenes_destino_id
 * @property $dproveedor_destino_id
 * @property $created_at
 * @property $updated_at
 *
 * @property Dclienteproveedor $dclienteproveedor
 * @property Nalmacen $nalmacen
 * @property Nalmacen $nalmacen
 * @property Dproductosalida[] $dproductosalidas
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dsalidaalmacen extends Model
{

    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['factura', 'precioventa', 'total', 'esventa', 'nalmacenes_origen_id', 'nalmacenes_destino_id', 'dproveedor_destino_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function dclienteproveedor()
    {
        return $this->belongsTo(\App\Models\Dclienteproveedor::class, 'dproveedor_destino_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nalmacen()
    {
        return $this->belongsTo(\App\Models\Nalmacen::class, 'nalmacenes_destino_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nalmacens()
    {
        return $this->belongsTo(\App\Models\Nalmacen::class, 'nalmacenes_origen_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dproductosalidas()
    {
        return $this->hasMany(\App\Models\Dproductosalida::class, 'id', 'dsalidaalmacen_id');
    }

}
